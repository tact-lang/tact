struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract Test1 {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Nested;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "hello";
        self.val4 = Nested{a: 10, b: false, c: "world"};
    }
}