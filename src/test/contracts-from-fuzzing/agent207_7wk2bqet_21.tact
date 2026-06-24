struct OptionalNested {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: String?;
}

contract Test19 {
    field: OptionalNested;
    init() {
        self.field = OptionalNested{
            innerOpt: InnerOpt{
                x: null,
                y: "abc"
            }
        };
    }
}