struct Inner {
    val: Int;
}

contract TestContract {
    maybe: Inner?;

    init() {
        self.maybe = Inner{ val: 5 };
    }
}