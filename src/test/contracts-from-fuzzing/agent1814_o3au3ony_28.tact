struct Crazy {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract CrazyTest {
    f: Crazy;

    init() {
        self.f = Crazy{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null
        };
    }
}
