struct NestedOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract NestedOptionalsInContract {
    field: NestedOptionals;

    init() {
        self.field = NestedOptionals{
            opt1: null,
            opt2: null,
            opt3: null
        };
    }
}