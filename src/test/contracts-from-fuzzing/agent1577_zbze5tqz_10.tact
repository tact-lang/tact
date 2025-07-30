struct Defaulty {
    x: Int = 5;
    y: Bool = false;
    z: String = "hi";
    w: Int? = null;
    t: String? = null;
}

contract TestContract {
    data: Defaulty;
    init() {
        self.data = Defaulty{}; // relies on defaults and optionals
    }
}