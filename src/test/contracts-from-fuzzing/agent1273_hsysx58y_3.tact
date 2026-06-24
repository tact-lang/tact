struct BigStruct {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Int?;
  h: Bool?;
  i: Address?;
  j: Cell?;
  k: Slice?;
  l: String?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            g: 2,
            h: false,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}