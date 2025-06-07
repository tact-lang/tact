struct Inner {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ val1: 5, val2: true };
    }
}