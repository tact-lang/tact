struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepSingleField {
    nested: Nested; 

    init() {
        self.nested = Nested{a: 1, b: true, c: "test"};
    }
}