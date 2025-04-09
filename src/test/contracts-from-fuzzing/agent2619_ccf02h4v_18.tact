struct WrappedInt {
    value: Int;
}

contract DefaultWrap {
    wi: WrappedInt = WrappedInt{ value: 777 };

    init() {
        self.wi = WrappedInt{ value: 888 };
    }
}