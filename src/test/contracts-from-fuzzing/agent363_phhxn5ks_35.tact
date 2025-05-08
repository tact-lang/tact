struct Inner {
    val: String?;
}

contract TestContract {
    data: Inner?;

    init() {
        self.data = null;
    }

    receive() {}
}