struct StructWithNestedOptionals {
    nested: Int?;
    txt: String?;
    flag: Bool?;
}

contract NestedOptionContract {
    s: StructWithNestedOptionals;

    init() {
        self.s = StructWithNestedOptionals{
            nested: null,
            txt: null,
            flag: null
        };
    }
}