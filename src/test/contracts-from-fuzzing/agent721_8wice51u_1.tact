struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    val: Int = 10;
    flag: Bool = true;
    text: String = "Hello";
    optionalInt: Int? = null;
    nestedField: Nested = Nested{a: 1, b: false, c: null};

    init() {
        self.val = 42;
    }
}