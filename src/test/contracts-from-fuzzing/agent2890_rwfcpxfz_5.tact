struct DeepNested {
  a: Int;
  b: Bool;
}

struct MidNested {
  dn: DeepNested;
  c: String;
}

struct TopLevel {
  mn: MidNested;
  d: Cell;
}

contract DeepNestedTest {
    v: TopLevel;

    init() {
        self.v = TopLevel{
            mn: MidNested{
                dn: DeepNested{ a: 5, b: false },
                c: "hi"
            },
            d: emptyCell()
        };
    }
}