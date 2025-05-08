struct StructWithStrings {
    s1: String;
    s2: String?;
}

contract StringsTest {
    data: StructWithStrings;

    init() {
        self.data = StructWithStrings{
            s1: "foo",
            s2: null,
        };
    }
}