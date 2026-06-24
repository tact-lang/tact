struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructTest {
    val: Nested;

    init() {
        self.val = Nested{a: 1, b: true, c: "ok"};
    }
}