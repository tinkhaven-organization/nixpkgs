{ stdenv, fetchurl, libgcrypt, libgpgerror, yacc, flex }:

# library that allows libbluray to play BDplus protected bluray disks
# libaacs does not infringe DRM's right or copyright. See the legal page of the website for more info.

# Info on how to use / obtain aacs keys:
# http://vlc-bluray.whoknowsmy.name/
# https://wiki.archlinux.org/index.php/BluRay


let baseName = "libbdplus";
    version  = "0.1.2";
in

stdenv.mkDerivation {
  name = "${baseName}-${version}";

  src = fetchurl {
    url = "http://download.videolan.org/pub/videolan/${baseName}/${version}/${baseName}-${version}.tar.bz2";
    sha256 = "02n87lysqn4kg2qk7d1ffrp96c44zkdlxdj0n16hbgrlrpiwlcd6";
  };

  buildInputs = [ libgcrypt libgpgerror ];

  nativeBuildInputs = [ ];

  meta = with stdenv.lib; {
    homepage = http://www.videolan.org/developers/libbdplus.html;
    description = "Library to access BD+ protected Blu-Ray disks";
    license = licenses.lgpl21;
    maintainers = with maintainers; [ abbradar ];
  };
}
