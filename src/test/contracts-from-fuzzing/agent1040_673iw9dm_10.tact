struct Inner {
    msg: String = "default message";
    num: Int;
}

contract TestContract {
    stored: Inner;

    init() {
        self.stored = Inner{
            num: 17
        };
    }
}