struct Nested {
    flag: Bool;
    count: Int;
}

contract DeepNestedContract {
    data: Nested;
    flag2: Bool;

    init() {
        self.data = Nested{flag: true, count: 123};
        self.flag2 = false;
    }
}