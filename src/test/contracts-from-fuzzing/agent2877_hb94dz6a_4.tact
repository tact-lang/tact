struct X {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalNest {
    f: X;

    init() {
        self.f = X{
            a: null,
            b: true,
            c: null,
        };
    }
}