struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract DefaultStructField {
    field: Defaulted;

    init() {
        self.field = Defaulted{};
    }
}