struct NestedRem {
    a: Int as uint32;
    payload: Cell as remaining;
}

contract RemNested {
    d: NestedRem;

    init() {
        self.d = NestedRem{ a: 11, payload: "data".asComment() };
    }
}