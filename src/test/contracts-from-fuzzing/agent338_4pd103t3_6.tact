struct Mixed {
  intVal: Int;
  optInt: Int?;
  flag: Bool;
  optFlag: Bool?;
  addr: Address;
  optAddr: Address?;
  text: String;
  optText: String?;
  box: Cell;
  optBox: Cell?;
}

contract TestContract {
  data: Mixed;

  init() {
    self.data = Mixed{
      intVal: 123,
      optInt: null,
      flag: true,
      optFlag: null,
      addr: myAddress(),
      optAddr: null,
      text: "abc",
      optText: null,
      box: emptyCell(),
      optBox: null
    };
  }
}