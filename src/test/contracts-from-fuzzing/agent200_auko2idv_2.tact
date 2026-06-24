struct Inner {
    flag: Bool;
    value: Int as uint32;
}

struct Outer {
    nested: Inner;
    amount: Int;
}

contract WithNestedStruct {
    saved: Outer;
    init() {
        self.saved = Outer{
            nested: Inner{flag: true, value: 123},
            amount: 999
        };
    }
}