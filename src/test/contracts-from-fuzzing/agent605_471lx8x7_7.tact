struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Int;
    h: Bool;
}

contract TestContract {
    data: Opts;

    init() {
        self.data = Opts{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "hello",
            g: 5,
            h: false
        };
    }
}