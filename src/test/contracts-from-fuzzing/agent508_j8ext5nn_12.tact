struct Nested {
    num: Int;
    flag: Bool;
}

contract UpdateTest {
    data: Nested;
    init() {
        self.data = Nested{ num: 5, flag: false };
        self.data = Nested{ num: 10, flag: true };
    }
}