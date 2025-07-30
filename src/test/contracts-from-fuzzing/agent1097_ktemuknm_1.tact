struct Nested {
    x: Int;
    y: Int?;
}

contract TestStorage {
    data: Nested;
    flag: Bool;
    count: Int;

    init() {
        self.data = Nested{ x: 1, y: null };
        self.flag = true;
        self.count = 0;
    }
}