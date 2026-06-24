struct Defaulted {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;
    e: String? = null;
}

contract TestContract {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}