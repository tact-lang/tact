struct Complex {
    one: Int? = null;
    two: Bool? = true;
    three: String? = null;
    four: String? = "hello";
    five: Bool? = null;
}

contract MixedOptionalsInit {
    data: Complex;

    init() {
        self.data = Complex{};
    }
}
