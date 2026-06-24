struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Nested;
    num: Int;
    flag: Bool;

    init() {
        self.data = Nested{
            a: 10,
            b: true
        };
        self.num = 5;
        self.flag = false;
    }
}
