struct Complex {
    id: Int;
    active: Bool;
    comment: String?;
    sub: SubComplex;
}

struct SubComplex {
    label: String;
    flag: Bool;
    count: Int;
}

contract ComplexStorage {
    data: Complex;

    init() {
        self.data = Complex{
            id: 100,
            active: true,
            comment: "test",
            sub: SubComplex{
                label: "l",
                flag: false,
                count: 7
            }
        };
    }
}