// Contract with optional struct having defaulted optional field
struct Inner {
    v: Int?;
}

contract NestedOptDef {
    d: Inner?;
    init() {
        self.d = Inner{ v: null };
    }
}