struct Complex {
    a: Int;
    b: Bool;
    c: SubComplex;
    d: String?;
}

struct SubComplex {
    x: Int?;
    y: String;
    z: Bool?;
}

contract TestStorage {
    data: Complex;

    init() {
        self.data = Complex{
            a: 5,
            b: false,
            c: SubComplex{
                x: null,
                y: "nested",
                z: true
            },
            d: null
        };
    }
}