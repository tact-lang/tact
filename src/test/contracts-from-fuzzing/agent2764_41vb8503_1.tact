struct Inner {
    flag: Bool;
    count: Int;
    data: Cell;
}

contract DeepNested {
    inner: Inner;

    init() {
        self.inner = Inner{
            flag: false,
            count: 42,
            data: emptyCell(),
        };
    }
}