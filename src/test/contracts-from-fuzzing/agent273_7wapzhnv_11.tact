struct BoolStruct {
  flag1: Bool;
  flag2: Bool;
  optFlag: Bool?;
}

contract TestContract {
  st: BoolStruct;

  init() {
    self.st = BoolStruct{
      flag1: true,
      flag2: false,
      optFlag: null
    };
  }
}