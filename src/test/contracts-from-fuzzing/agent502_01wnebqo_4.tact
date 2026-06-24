struct OptionalHeavy {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    data: OptionalHeavy;

    init() {
        self.data = OptionalHeavy{
            a: null,
            b: true,
            c: null,
            d: 4,
            e: null,
            f: "hello"
        };
    }
}