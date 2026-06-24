struct Complex {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
    d: Int = 5;
    e: String = "hey";
    f: Bool = false;
}

contract TestContract {
    val: Complex;

    init() {
        self.val = Complex{};
    }
}
