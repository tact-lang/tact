struct Defaulted {
    a: Int = 7;
    b: Bool = false;
    c: String = "ok";
}

contract StructDefault {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}
