struct MultiType {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;
    f: Builder?;
    g: Address?;
}

contract ComboStorage {
    val: MultiType;

    init() {
        self.val = MultiType{
            a: 1,
            b: true,
            c: "ok",
            d: null,
            e: emptyCell().asSlice(),
            f: null,
            g: null
        };
    }
}