struct NestedOpt {
    innerOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract TestContract {
    field: NestedOpt = NestedOpt{
        innerOpt: null,
        boolOpt: true,
        strOpt: null,
    };

    init() {
        self.field = NestedOpt{
            innerOpt: 123,
            boolOpt: null,
            strOpt: "hi",
        };
    }

    receive() {
        let _ = self.field.innerOpt;
    }
}