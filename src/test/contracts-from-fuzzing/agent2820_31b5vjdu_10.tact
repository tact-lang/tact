struct Defaults {
  foo: Int = 42;
  bar: Bool;
}

contract DefaultFieldInStruct {
  persist: Defaults;

  init() {
    self.persist = Defaults{
      bar: true
    };
  }
}