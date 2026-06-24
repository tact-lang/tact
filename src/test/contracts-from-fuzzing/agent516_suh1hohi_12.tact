struct NestedOptionalStruct {
    inn: Int?;
    flag: Bool?;
}

contract NestedOptStructTest {
    field: NestedOptionalStruct?;

    init() {
        self.field = null;
    }
}
