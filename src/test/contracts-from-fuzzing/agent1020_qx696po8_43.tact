struct OnlyNullables {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullableFieldsOnlyTest {
    data: OnlyNullables;

    init() {
        self.data = OnlyNullables{ a:null, b:null, c:null };
    }
}