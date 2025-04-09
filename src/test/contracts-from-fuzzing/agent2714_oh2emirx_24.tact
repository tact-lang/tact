struct Complex {
    v1: Int;
    v2: Int?;
    v3: Bool;
    v4: Address?;
    v5: String;
}

contract Test24 {
    c: Complex;

    init() {
        self.c = Complex{
            v1: 1,
            v2: null,
            v3: false,
            v4: null,
            v5: "hello"
        };
    }
}