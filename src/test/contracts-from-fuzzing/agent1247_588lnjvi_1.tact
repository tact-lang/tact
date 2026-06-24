struct Nested {
    val: Int;
}

contract TestStorage {
    nested: Nested;
    num: Int = 5;

    init() {
        self.nested = Nested{val: 10};
    }
}