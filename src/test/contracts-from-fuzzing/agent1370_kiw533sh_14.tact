struct BigNested {
    s1: Int;
    s2: String;
    s3: Int?;
    s4: Bool;
    s5: String?;
    s6: Int;
    s7: Bool?;
    s8: String;
    s9: Int;
    s10: Bool;
}

contract MoreFieldsNestedTest {
    field: BigNested;

    init() {
        self.field = BigNested{
            s1: 1, s2: "a", s3: null, s4: false, s5: "b",
            s6: 42, s7: null, s8: "c", s9: 100, s10: true
        };
    }
}