struct Inner {
    a: Int;
    b: Int?;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{
            a: 42
            // omit optional b
        };
    }
}