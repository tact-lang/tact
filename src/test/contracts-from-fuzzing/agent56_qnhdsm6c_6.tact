struct Inner {
    FieldA: Int;
    FieldB: Int;
}

struct Outer {
    InnerField: Inner;
    Data: Int;
}

contract TestNested {
    receive() {
        let o = Outer {
            InnerField: Inner { FieldA: 10, FieldB: 20 },
            Data: 100
        };
        return;
    }
}
