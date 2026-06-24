struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract ManyOptStruct {
    opts: Opts;

    init() {
        self.opts = Opts{
            a: 1,
            b: null,
            c: true,
            d: myAddress(),
        };
    }
}