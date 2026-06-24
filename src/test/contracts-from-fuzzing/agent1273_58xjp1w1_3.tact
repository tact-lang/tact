struct NestedOptional {
    name: String?;
    age: Int?;
    active: Bool?;
}

contract OptionalFieldsTest {
    user: NestedOptional;

    init() {
        self.user = NestedOptional{name:null, age:null, active:null};
    }
}