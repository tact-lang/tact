struct Inner {
    x: Int;
    y: Int;
    flag: Bool;
}

contract NestedContract {
    data: Inner;

    init() {
        self.data = Inner{
            x: 1,
            y: 2,
            flag: true,
        };
    }
}
