struct OptionStruct {
  x: Int?;
  y: Bool?;
}

struct ContainsOptStruct {
  z: OptionStruct?;
}

contract Test {
  optfield: ContainsOptStruct;

  init() {
    self.optfield = ContainsOptStruct{
      z: OptionStruct{
        x: null,
        y: true
      }
    };
  }
}