struct Inner {
    x: Int = 1;
    y: Bool = true;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{};
    }
}
