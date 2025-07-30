struct OptNest {
    innerOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

struct NestedOpt {
    nest: OptNest?;
    id: Int;
}

contract TestOptNested {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            nest: OptNest{
                innerOpt: null,
                boolOpt: true,
                strOpt: null,
            },
            id: 5,
        };
    }
}