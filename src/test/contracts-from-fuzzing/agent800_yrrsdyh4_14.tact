struct OptionalNested {
    field: OptionalNestedInner?;
}

struct OptionalNestedInner {
    subfield: Int?;
}

contract OptNestTest {
    val: OptionalNested;
    init() {
        self.val = OptionalNested{
            field: OptionalNestedInner{subfield:null},
        };
    }
}