struct NestedWithOptionals {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalStructFieldsContract {
    nestedOpt: NestedWithOptionals;

    init() {
        self.nestedOpt = NestedWithOptionals{
            s: null,
            b: null,
            i: null
        };
    }
}