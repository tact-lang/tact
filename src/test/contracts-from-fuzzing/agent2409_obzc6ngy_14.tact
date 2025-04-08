struct Inner {
    val: Int as int64;
}

contract SerializedIntStruct {
    f: Inner;

    init() {
        self.f = Inner{ val: 1234567890 };
    }
}