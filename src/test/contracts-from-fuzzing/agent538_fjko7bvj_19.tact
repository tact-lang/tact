struct Big {
  f1: Int = 1; f2: Bool = false; f3: String = "a"; f4: Address;
  f5: Bool?; f6: Int?; f7: String = "b"; f8: Address;
}

contract HugeStruct {
  data: Big;

  init() {
    self.data = Big{
      f4: myAddress(),
      f5: null,
      f6: null,
      f8: myAddress(),
    };
  }
}
