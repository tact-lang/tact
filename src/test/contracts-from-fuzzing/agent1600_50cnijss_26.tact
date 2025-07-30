struct Inner {
    flag: Bool? = true;
    num: Int;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{
            num: 77
        };
    }
}