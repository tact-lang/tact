struct Inner {
    x: Int;
    y: Int?;
}

contract NestedOptional {
    point: Inner;
    flag: Bool;

    init() {
        self.point = Inner{ x: 42, y: null };
        self.flag = true;
    }
}
