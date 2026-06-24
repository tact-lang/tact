struct WrappedInt {
    val: Int;
}

contract SeveralWrapped {
    w1: WrappedInt;
    w2: WrappedInt;
    w3: WrappedInt;

    init() {
        self.w1 = WrappedInt{ val: 1 };
        self.w2 = WrappedInt{ val: 2 };
        self.w3 = WrappedInt{ val: 3 };
    }
}