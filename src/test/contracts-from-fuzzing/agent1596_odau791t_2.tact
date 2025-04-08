struct Nested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

contract NestedStructTest {
    nestedField: Nested = Nested{ inner1: 10, inner2: true, inner3: "hi" };

    receive() {
        let _ = self.nestedField.inner1;
    }
}