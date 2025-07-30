struct Inner {
    x: Int = 1;
    y: Bool = true;
    s: String = "nested";
}

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{};
    }
}