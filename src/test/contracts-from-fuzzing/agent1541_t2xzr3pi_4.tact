struct Complex {
    n: Int;
    b: Bool;
    s: String;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract OptionalsStorage {
    complex: Complex;

    init() {
        self.complex = Complex{
            n: 100,
            b: false,
            s: "abc",
            optInt: null,
            optStr: "maybe",
            optBool: null,
        };
    }

    receive() {
        if (self.complex.optInt == null) {
            self.complex.optInt = 1;
        } else {
            self.complex.optInt = self.complex.optInt!! + 1;
        }
    }
}