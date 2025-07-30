struct Inner {
    x: Int?;
    y: Int?;
}

contract TestContract {
    optStruct: Inner;

    init() {
        self.optStruct = Inner{ x: null, y: 123 };
    }
}
