// nested struct inside optional inside struct inside contract
struct DeepInner {
    flag: Bool;
}

struct MiddleOpt {
    nested: DeepInner?;
    num: Int;
}

contract OptsInStructs {
    field: MiddleOpt;
    init() {
        self.field = MiddleOpt{
            nested: null,
            num: 9
        };
    }
}