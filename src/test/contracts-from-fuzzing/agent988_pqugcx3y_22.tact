struct OptDeep {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalDeep {
    data: OptDeep;

    init() {
        self.data = OptDeep{
            innerOpt: Inner{ val: 88 }
        };
    }
}