struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract Opts {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
