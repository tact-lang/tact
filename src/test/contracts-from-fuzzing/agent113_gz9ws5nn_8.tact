struct Base {
  field1: Int;
}

struct Extended {
  base: Base;
  extra: Int;
  flag: Bool;
}

contract TestExtendedStruct {
  instance: Extended;

  init() {
    self.instance = Extended{
      base: Base{field1: 77},
      extra: 88,
      flag: true
    };
  }
}