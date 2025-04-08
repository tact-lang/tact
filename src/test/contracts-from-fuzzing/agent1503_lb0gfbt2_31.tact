struct Inner {
    a: Int;
}

contract DeepOptPers {
    a: Int?;
    i: Inner?;

    init() {
        self.a = null;
        self.i = null;
    }

    receive() {}
}