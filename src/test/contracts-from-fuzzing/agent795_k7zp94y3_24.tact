struct Inner {
    builder: Builder;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{ builder: beginCell() };
    }
}