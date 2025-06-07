struct Complex {
    a: Int;
    b: String;
    c: Bool?;
}

contract StructFieldWithOptional {
    data: Complex;

    init() {
        self.data = Complex{
            a: 7,
            b: "x",
            c: null
        };
    }
}