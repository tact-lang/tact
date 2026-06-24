struct Nested {
    deepInt: Int;
    deepBool: Bool;
    deepString: String;
}

contract TestContract {
    nested: Nested;
    init() {
        self.nested = Nested{ deepInt: 7, deepBool: false, deepString: "xyz" };
    }
}