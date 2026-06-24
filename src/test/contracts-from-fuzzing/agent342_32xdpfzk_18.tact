struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Slice?;
    e: String?;
    f: Address?;
}

contract Test17 {
    opts: ManyOptional;

    init() {
        self.opts = ManyOptional{
            a: null,
            b: 2,
            c: null,
            d: null,
            e: "hello",
            f: myAddress(),
        };
    }
}