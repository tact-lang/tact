struct OptionalNested {
    innerOpt: Bool?;
    deep: DeepInner?;
}

struct DeepInner {
    x: Int;
    y: String?;
}

contract TestContract {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            innerOpt: null,
            deep: null
        };
    }
}