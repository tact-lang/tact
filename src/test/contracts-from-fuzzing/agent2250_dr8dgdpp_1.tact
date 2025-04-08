struct Inner {
    x: Int;
    y: Int?;
}

contract DeepNested {
    data: Inner;
    flag: Bool;
    count: Int;

    init() {
        self.data = Inner{ x: 10, y: null };
        self.flag = true;
        self.count = 1;
    }
}