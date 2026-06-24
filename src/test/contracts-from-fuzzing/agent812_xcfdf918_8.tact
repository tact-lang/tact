struct DeepOpt {
    innerOpt: OptInner?;
    val: Int;
}

struct OptInner {
    a: Int?;
    b: Bool?;
}

contract DeepOptionals {
    field: DeepOpt;

    init() {
        self.field = DeepOpt{ innerOpt: null, val: 99 };
    }
}