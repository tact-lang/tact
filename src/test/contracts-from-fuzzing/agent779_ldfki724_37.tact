struct Defaulted {
    x: Int = 1;
    y: Int? = null;
    z: Bool = true;
    t: Bool? = false;
}

contract DefaultsComplex {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}