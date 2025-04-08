struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct Complex {
    opt1: NestedOptional?;
    opt2: NestedOptional?;
}

contract OptTest {
    storage: Complex;

    init() {
        self.storage = Complex{
            opt1: null,
            opt2: null
        };
    }
}
