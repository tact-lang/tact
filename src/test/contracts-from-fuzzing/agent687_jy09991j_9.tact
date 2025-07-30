struct MixDefaultOpt {
  foo: Int = 0;
  bar: Int?;   
  baz: String = "hi";
  qux: Bool?;
}

contract MixedDefaults {
  val: MixDefaultOpt;

  init() {
    self.val = MixDefaultOpt{
      bar: null,
      qux: null
    };
  }
}