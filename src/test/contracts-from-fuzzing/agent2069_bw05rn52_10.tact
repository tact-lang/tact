struct MultiInner {
    a: InnerA;
    b: InnerB;
    c: InnerC;
}

struct InnerA {
    x: Int;
    y: String;
}

struct InnerB {
    f: Bool;
    g: Cell;
}

struct InnerC {
    addr: Address;
    slice: Slice;
}

contract ContWithMultiInner {
    data: MultiInner;

    init() {
        self.data = MultiInner{
            a: InnerA{x: 6, y: "hi"},
            b: InnerB{f: false, g: emptyCell()},
            c: InnerC{addr: myAddress(), slice: emptyCell().asSlice()}
        };
    }
}