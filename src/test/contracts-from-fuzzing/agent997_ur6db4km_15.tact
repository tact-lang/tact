struct Inner {
    z: Int?;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{};
    }
}