struct ManyOptions {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
}

contract OptionFields {
  data: ManyOptions;

  init() {
    self.data = ManyOptions{
      a: null,
      b: true,
      c: null,
      d: 5
    };
  }
}