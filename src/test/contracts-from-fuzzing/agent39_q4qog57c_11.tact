struct Defaulted {
    x: Int = 42;
    y: Bool = true;
    s: String = "hello";
}

contract TestContract {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}