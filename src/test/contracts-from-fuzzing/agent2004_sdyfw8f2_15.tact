struct HasCrc {
  code: Int = crc32("Hello");
}

contract WithCrc {
  val: HasCrc = HasCrc{};
  init() {}
}
