struct InnerNested {
    ib: Bool;
    inum: Int as uint64;
    ostr: String?;    
}

struct OuterNested {
    s: String;
    nested: InnerNested;
    optNested: InnerNested?;
}

contract DeepNestedTest {
    field: OuterNested;
    
    init() {
        self.field = OuterNested{
            s: "abc",
            nested: InnerNested{ ib: true, inum: 123, ostr: null },
            optNested: null
        };
    }
}
