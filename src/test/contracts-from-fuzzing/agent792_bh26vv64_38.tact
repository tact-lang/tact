struct Details {
    a: Int = 42;
    b: Bool? = false;
    c: String = "default";
}

contract TestC {
    details: Details;

    init() {
        self.details = Details{};
    }
}