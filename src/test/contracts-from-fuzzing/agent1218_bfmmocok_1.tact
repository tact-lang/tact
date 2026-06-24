struct Nested {
    a: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    field1: Int = 0;
    field2: Bool = true;
    field3: String = "test";
    nested: Nested = Nested{ a: 1, b: false, s: "x" };

    init() {
        self.field1 = 10;
        self.field2 = false;
        self.field3 = "hello";
        self.nested = Nested{ a: 42, b: true, s: "world" };
    }
}