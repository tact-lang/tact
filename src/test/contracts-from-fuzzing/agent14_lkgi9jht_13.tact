struct Varied {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    state: Varied;

    init() {
        self.state = Varied{
            a: 5,
            b: false,
            c: null,
            d: true,
            e: "hello",
            f: null,
        };
    }
}