struct Nested {
    count: Int;
    flag: Bool;
    text: String;
}

contract StructFieldExample {
    data: Nested;

    init() {
        self.data = Nested{count: 5, flag: true, text: "hi"};
    }

    receive() {
        self.data = Nested{count: self.data.count + 1, flag: !self.data.flag, text: self.data.text};
    }
}