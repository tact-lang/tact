struct X {
    a: Int?;
    b: Bool?;
}

contract OptionalDefaults {
    data: X = X{
        a: null,
        b: null,
    };

    init() {
        self.data = X{
            a: 5,
            b: true,
        };
    }
}