struct Inner {
    val: Int = 1;
    opt: Int?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{};
    }
}