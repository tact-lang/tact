struct SDefault {
  foo: Int = 42;
  bar: Bool = true;
}

contract DefaultsInStruct {
  data: SDefault;

  init() {
    self.data = SDefault{ foo: 55, bar: false };
  }
}