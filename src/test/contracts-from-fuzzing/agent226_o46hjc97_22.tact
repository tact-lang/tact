struct Defaulted {
    x: Int = 5;
    y: Bool = false;
    s: String = "hello";
}

contract TestDefaulted {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}
