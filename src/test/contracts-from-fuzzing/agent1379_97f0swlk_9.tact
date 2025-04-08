struct S {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    cl: Cell;
    sl: Slice;
    bl: Builder;
    o: Int?;
}

contract BigPersistent {
    f0: S;
    f1: S;
    f2: S;
    f3: S;
    f4: S;
    
    init() {
        let temp = S{
            i: 1,
            b: true,
            s: "abc",
            a: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell(),
            o: null
        };
        self.f0 = temp;
        self.f1 = temp;
        self.f2 = temp;
        self.f3 = temp;
        self.f4 = temp;
    }
}
