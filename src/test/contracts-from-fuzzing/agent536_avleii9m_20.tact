struct Nested {
    name: String?;
    age: Int?;
}

contract NestedOptOpt {
    data: Nested? = null;

    init() {
        self.data = Nested{name: "Bob", age: null};
    }
}