struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    value: Int;
    flag: Bool;
    data: Nested;

    init() {
        self.value = 1;
        self.flag = true;
        self.data = Nested{ a: 42, b: false };
    }
}