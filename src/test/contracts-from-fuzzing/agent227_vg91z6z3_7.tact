struct MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Cell?;
    f: Slice;
}

contract OptionalStruct {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            a: null,
            b: true,
            c: null,
            d: 100,
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }

    receive() {
        let _ = self.data.c;
    }
}
