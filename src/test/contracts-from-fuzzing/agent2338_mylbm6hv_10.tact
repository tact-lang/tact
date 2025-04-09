struct NestedStringTest {
    text: String;
    info: InnerInfo;
}

struct InnerInfo {
    note: String;
}

contract NestedStrings {
    field: NestedStringTest;

    init() {
        self.field = NestedStringTest{
            text: "outer",
            info: InnerInfo{ note: "inner" }
        };
    }
}