struct Inner {
    x: Int?;
}

contract SingleOptInStruct {
    s: Inner;

    init() {
        self.s = Inner{ x: null };
    }
}