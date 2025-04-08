struct Inner {
    val: Int?;
}

contract OptionalInStruct {
    data: Inner;

    init() {
        self.data = Inner { val: null };
    }

    receive() {}
}