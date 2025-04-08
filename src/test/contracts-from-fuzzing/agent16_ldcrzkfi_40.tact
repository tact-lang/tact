struct Inner {
    val: Int;
}

contract ChangetoNull {
    s: Inner?;

    init() {
        self.s = Inner{ val: 5 };
        self.s = null;
    }
}