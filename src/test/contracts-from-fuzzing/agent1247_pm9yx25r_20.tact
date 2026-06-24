struct ParamStruct {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  addrVal: Address;
}

contract ParamContract {
  p: ParamStruct;

  init() {
    self.p = ParamStruct{
      intVal: 8,
      boolVal: true,
      stringVal: "x",
      addrVal: myAddress()
    };
  }
}