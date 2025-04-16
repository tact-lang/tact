struct NestedNullable {
    name: String;
    age: Int?;
    flag: Bool;
}

contract OptStructTest {
    data: NestedNullable?;

    init() {
        self.data = NestedNullable{
            name: "Alice",
            age: null,
            flag: true,
        };
    }
}