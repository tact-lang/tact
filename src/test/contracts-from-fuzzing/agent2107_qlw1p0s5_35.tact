struct NestingOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ComplexOptional {
    payload: NestingOptional;

    init() {
        self.payload = NestingOptional{
            a: null,
            b: null,
            c: null,
        };
    }
}