struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestOptStruct {
    val: ManyOptional = ManyOptional{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null
    };

    init() {
        self.val = ManyOptional{
            a: 1,
            b: true,
            c: "ok",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}
