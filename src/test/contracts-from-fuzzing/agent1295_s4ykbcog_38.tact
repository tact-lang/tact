// optional message inside non-optional struct inside optional struct
message(0x20) InnerMsg { foo: Int; }

struct Middle {
    nested: InnerMsg?;
}

struct Outer {
    inner: Middle;
}

contract NestedComplexOpt {
    store: Outer?;
    init() {
        self.store = Outer{
            inner: Middle{
                nested: InnerMsg{ foo: 44 }
            }
        };
    }
}