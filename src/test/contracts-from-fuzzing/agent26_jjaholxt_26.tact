struct Complex {
    id: Int;
    name: String;
    active: Bool;
    comment: String?;
    score: Int?;
    flag: Bool?;
}

contract NestedComplex {
    info: Complex;
    init() {
        self.info = Complex{
            id: 42,
            name: "Test",
            active: true,
            comment: null,
            score: null,
            flag: null
        };
    }
}