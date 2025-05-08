struct Complex {
    s: String;
    i: Int?;
    b: Bool?;
}

contract OptionalFields {
    data: Complex;

    init() {
        self.data = Complex{
            s: "opt",
            i: null,
            b: true,
        };
    }
}