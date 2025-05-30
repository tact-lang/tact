struct Mixed {
  foo: Int;
  bar: Bool;
  baz: String;
  opt1: Int?;
  opt2: Bool?;
}

contract MixingAll {
    m: Mixed;
    init() {
        self.m = Mixed{ foo: 1, bar: true, baz: "hi", opt1: null, opt2: false };
    }
}
