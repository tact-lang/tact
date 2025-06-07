struct Inner {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            val1: 1,
            val2: true,
            val3: "test"
        };
    }
}