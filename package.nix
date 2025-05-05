{ stdenv, ... }: stdenv.mkDerivation {
  name = "dummy session";
  providedSessions = [ "text" ];

  unpackPhase = "true";
  buildPhase = "true";
  installPhase = ''
    mkdir -p $out/share/wayland-sessions
    cat <<EOF > $out/share/wayland-sessions/text.desktop
    [Desktop Entry]
    Name=Terminal
    Comment=Dummy graphical session that opens terminal
    Exec=\\\$(whoami | xargs getent passwd | cut -d':' -f7)
    Type=Application
    Keywords=terminal;session
    EOF
  '';
}