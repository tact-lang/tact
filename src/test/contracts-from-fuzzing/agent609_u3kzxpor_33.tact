struct Inner {
    val: Int;
}

contract OptionalOuter {
    data: Inner?;

    init() {
        self.data = Inner{ val: 999 };
    }
}
