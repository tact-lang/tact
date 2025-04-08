struct Inner {
    name: String;
    age: Int;
}

contract NestedStruct {
    person: Inner;

    init() {
        self.person = Inner{ name: "Alice", age: 30 };
    }
}