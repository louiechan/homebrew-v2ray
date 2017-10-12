class V2rayCore < Formula
  desc "A platform for building proxies to bypass network restrictions."
  homepage "https://www.v2ray.com/"
  url "https://github.com/v2ray/v2ray-core/releases/download/v2.40/v2ray-macos.zip"
  version "2.40"
  sha256 "06172d499a5e7ce752fae05d5cbdbed86f506c0c15af0d215cfd6e9a942b9115"

  def install
    bin.install "v2ray"

    etc.install "config.json"
  end

  plist_options :manual => "v2ray -config=#{HOMEBREW_PREFIX}/etc/v2ray-core/config.json"

  def plist; <<-EOS.undent
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/v2ray</string>
        <string>-config</string>
        <string>#{etc}/v2ray-core/config.json</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
  </plist>
  EOS
end
  
  test do
    system "#{bin}/v2ray", "-version"
  end
end
