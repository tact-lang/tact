struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyNested (
    val1: Nested,
    val2: Nested,
    val3: Nested
) {
    receive() {
        dump(self.val1.a + self.val2.a + self.val3.a);
    }
}