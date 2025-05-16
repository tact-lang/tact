struct HasDefault {
    a: Int = 5;
    b: Bool;
    c: String = "abc";
}

contract DefaultStructFields {
    s: HasDefault;
    init() {
        self.s = HasDefault{ a: 10, b: true, c: "xyz" };
    }
}