class Ntp < Formula
  desc ""
  homepage ""
  url "https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p6.tar.gz"
  version "4.2.8p6"
  sha256 "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"

  depends_on "openssl"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-openssl-incdir=#{Formula["openssl"].opt_prefix}/include"
                          "--with-openssl-libdir=#{Formula["openssl"].opt_prefix}/lib"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "ntpd -gqc /dev/null pool.ntp.org"
  end
end
