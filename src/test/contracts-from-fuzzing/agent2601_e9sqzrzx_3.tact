struct BigNested {
    num1: Int as uint8;
    num2: Int as uint64;
    bigNum: Int;
    text: String;
    flag: Bool;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: BigNested;
    init() {
        self.a = 1;
        self.b = false;
        self.c = "s";
        self.d = BigNested{
            num1: 5,
            num2: 10000,
            bigNum: 123456789,
            text: "nested",
            flag: true
        };
    }
}