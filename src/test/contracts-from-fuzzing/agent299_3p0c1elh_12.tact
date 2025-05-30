struct OptInNested {
    subval: Int?;
}

struct ContainsOptInNested {
    inner: OptInNested;
}

contract OptInNestedFieldTest {
    field: ContainsOptInNested;
    init() {
        self.field = ContainsOptInNested{inner: OptInNested{subval: null}};
    }
}