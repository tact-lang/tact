struct Composite {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  sl: Slice;
}

contract Test {
    data: Composite;

    init() {
        self.data = Composite{
            i: 5,
            b: false,
            s: "str",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}