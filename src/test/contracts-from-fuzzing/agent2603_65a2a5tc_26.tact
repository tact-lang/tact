struct Inner {
    value: Int;
}

contract WithDefaultStruct {
    data: Inner = Inner{ value: 10 };

    init() {
        self.data = Inner{ value: 20 };
    }
}
