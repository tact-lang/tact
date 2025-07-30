struct Defaulted {
    x: Int = 42;
    y: Bool = true;
    z: String = "hi";
}

contract TestContract {
    dd: Defaulted;

    init() {
        self.dd = Defaulted{};
    }
}