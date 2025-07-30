struct OneBool { flag: Bool; }

contract ContractWithBoolStruct {
  s: OneBool;

  init() {
    self.s = OneBool{ flag: true };
  }
}
