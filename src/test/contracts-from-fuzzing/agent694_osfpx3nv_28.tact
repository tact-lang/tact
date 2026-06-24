struct Inner {
    a: Int;
    b: Int = 777;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{
            a: 10
        };
    }
}