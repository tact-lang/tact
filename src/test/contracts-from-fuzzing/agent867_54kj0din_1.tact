struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "test";
    val4: Nested = Nested{a: 2, b: false, c: "nested"};

    init() {
        self.val1 = 10;
        self.val2 = false;
        self.val3 = "modified";
        self.val4 = Nested{a: 20, b: true, c: "mod_nested"};
    }
}
