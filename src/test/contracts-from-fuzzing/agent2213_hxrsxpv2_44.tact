struct Inner {
    n: Int?;
}

contract OptStruct {
    x: Inner?;

    init() {
        self.x = null;
    }
}
