struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    point: Inner;
    flag: Bool;
    name: String;
    count: Int;

    init() {
        self.point = Inner{ x: 1, y: null };
        self.flag = true;
        self.name = "hello";
        self.count = 42;
    }
}