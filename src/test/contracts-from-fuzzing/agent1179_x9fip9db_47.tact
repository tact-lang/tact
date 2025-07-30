struct Inner {
    val: Int; // mandatory
}

contract OptionalStructContract {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }

    receive() {}
}