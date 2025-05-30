struct BottomLevel {
  i: Int = 7;
  b: Bool = true;
  s: String = "b";
  addr: Address;
  c: Cell;
  sl: Slice;
  bu: Builder;
}

struct MiddleLevel {
  opt1: Int?;
  opt2: Bool?;
  opt3: String?;
  nested: BottomLevel;
}

struct TopLevel {
  m: MiddleLevel;
}

contract TestAllPrimitivesCombo {
  store: TopLevel;
  init() {
    self.store = TopLevel{
      m: MiddleLevel{
        opt1: null,
        opt2: null,
        opt3: null,
        nested: BottomLevel{
          addr: myAddress(),
          c: emptyCell(),
          sl: emptyCell().asSlice(),
          bu: beginCell()
        }
      }
    };
  }
}
