struct Nested {
    n1: Int;
    n2: Bool;
    n3: String;
}

contract Test {
    value: Nested = Nested{ n1: 0, n2: false, n3: "" };

    init() {
        self.value = Nested{ n1: 42, n2: true, n3: "hi" };
    }
}
