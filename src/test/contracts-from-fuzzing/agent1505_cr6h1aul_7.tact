struct MixedTypes {
    i: Int;
    b: Bool?;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
    bl: Builder;
    nested: Nested;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract Test {
    m: MixedTypes;
    init() {
        self.m = MixedTypes{
            i: 12,
            b: null,
            s: "hi",
            addr: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell(),
            nested: Nested{ x: 1, y: false }
        };
    }
}