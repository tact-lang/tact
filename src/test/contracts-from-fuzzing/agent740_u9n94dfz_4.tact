struct AllNullable {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract NullableFieldsTest {
    data: AllNullable;
    init() {
        self.data = AllNullable{};
    }
}