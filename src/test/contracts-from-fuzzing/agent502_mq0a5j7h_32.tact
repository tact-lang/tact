struct LongStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
  e: Cell;
  f: Address;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Slice?;
  k: Cell?;
  l: Address?;
  m: Int;
  n: Int;
  o: Int;
}

contract DiverseStructFields {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            a: 1,
            b: true,
            c: "x",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: 2,
            n: 3,
            o: 4,
        };
    }
}