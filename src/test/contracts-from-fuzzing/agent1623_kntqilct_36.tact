struct MixAll {
    a: Int;
    b: Bool?;
    c: Address;
    d: Cell?;
    e: Slice;
    f: Int?;
    g: Bool;
}

contract MixStorage {
    val: MixAll;
    init() {
        self.val = MixAll{
            a: 42,
            b: null,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: 555,
            g: true,
        };
    }
}