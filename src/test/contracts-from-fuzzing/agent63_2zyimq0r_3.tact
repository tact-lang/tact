struct Inner {
    optVal: Int?;
}

contract OptStruct {
    data: Inner;

    init() {
        self.data = Inner{ optVal: null };
    }
}