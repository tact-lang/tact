struct Inner {
    a: Int = 1;
    b: Bool = false;
}

contract TestContract {
    i: Inner?;

    init() {
        self.i = Inner{};
    }
}