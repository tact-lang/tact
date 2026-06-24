struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    addr: Address;
    opti: Int?;
    opts: String?;
}

contract MixedStructStorage {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            i: 1,
            b: true,
            s: "hi",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            addr: myAddress(),
            opti: null,
            opts: "hello"
        };
    }
}