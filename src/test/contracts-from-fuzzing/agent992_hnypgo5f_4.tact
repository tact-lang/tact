struct OptionalNested {
    innerVal: Int?;
    innerStr: String?;
    innerFlag: Bool?;
}

contract TestContract {
    opt: OptionalNested;
    init() {
        self.opt = OptionalNested{
            innerVal: null,
            innerStr: null,
            innerFlag: true,
        };
    }
}
