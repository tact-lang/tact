struct Defaulty {
    a: Int = 5;
    b: Bool? = null;
}

contract TestContract {
    stuff: Defaulty;

    init() {
        self.stuff = Defaulty{ b: null };
    }
}