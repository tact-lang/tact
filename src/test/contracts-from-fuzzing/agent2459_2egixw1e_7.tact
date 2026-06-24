struct Mixed {
  one: Int;
  two: Bool;
  three: String;
  four: Address;
  five: Cell;
  six: Slice;
}

contract TestContract {
  data: Mixed;

  init() {
    self.data = Mixed{
      one: 1,
      two: true,
      three: "hello",
      four: myAddress(),
      five: emptyCell(),
      six: emptyCell().asSlice()
    };
  }
}