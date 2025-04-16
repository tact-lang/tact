struct OptAndNested {
    abool: Bool?;
    aint: Int?;
    astr: String?;
    next: InnerNest?;
}

struct InnerNest {
    value: Int;
    flag: Bool;
}

contract OptionNestedTest {
    field: OptAndNested;

    init() {
        self.field = OptAndNested{
            abool: null,
            aint: null,
            astr: null,
            next: null,
        };
    }
}