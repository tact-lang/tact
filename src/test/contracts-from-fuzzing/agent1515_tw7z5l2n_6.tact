struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptTest {
    vals: Opts;

    init() {
        self.vals = Opts{
            a: 1,
            b: true,
            c: "hello",
            d: null,
        };
    }

    receive() {
        dump(self.vals.a);
    }
}