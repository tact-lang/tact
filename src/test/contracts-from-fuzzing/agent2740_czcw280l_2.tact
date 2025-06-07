struct Nested {
    n1: Int;
    n2: Bool;
    n3: String;
}

contract DeepTest {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            n1: 10,
            n2: false,
            n3: "abc"
        };
    }
}