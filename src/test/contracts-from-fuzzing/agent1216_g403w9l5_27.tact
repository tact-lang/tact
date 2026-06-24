struct SimpleOpt {
  a: Int?;
  s: String;
}

contract StructOptionalDefaults {
  so: SimpleOpt;

  init() {
    self.so = SimpleOpt{
      a: null,
      s: "str",
    };
  }
}