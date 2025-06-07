struct S {
    a: Int;
    b: Bool?;
    c: Int?;
    d: String?;
    e: Bool;
}

contract DeepOptional {
    value: S?;

    init() {
        self.value = S{
            a: 1,
            b: null,
            c: 42,
            d: null,
            e: true,
        };
    }
}
