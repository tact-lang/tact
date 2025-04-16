struct Nested {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{flag: true, num: 123};
    }
}