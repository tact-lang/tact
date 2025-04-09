struct Inner {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    innerField: Inner;

    init() {
        self.innerField = Inner{ val1: 10, val2: true };
    }
}