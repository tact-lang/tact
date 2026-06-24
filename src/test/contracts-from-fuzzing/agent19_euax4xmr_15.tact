struct Config {
  owner: Address?;
  purpose: String?;
  enabled: Bool?;
  count: Int?;
}

contract Test {
  conf: Config;

  init() {
    self.conf = Config{
      owner: null,
      purpose: "testing",
      enabled: null,
      count: 42,
    };
  }
}