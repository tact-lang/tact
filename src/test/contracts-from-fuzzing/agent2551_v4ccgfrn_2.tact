struct NestedOptionalStruct {
    name: String;
    age: Int?;
    alive: Bool?;
}

contract NestedStructField {
    info: NestedOptionalStruct;

    init() {
        self.info = NestedOptionalStruct{
            name: "Alice",
            age: null,
            alive: true,
        };
    }
}