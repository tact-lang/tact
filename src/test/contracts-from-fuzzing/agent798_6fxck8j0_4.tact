struct Medium {
  a: Int;
  b: Bool;
  c: Address?;
  d: String;
  e: Cell;
  f: Slice;
  g: Builder;
}

contract OptField {
    data: Medium;

    init() {
        self.data = Medium{
            a: 2,
            b: true,
            c: null,
            d: "str",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}