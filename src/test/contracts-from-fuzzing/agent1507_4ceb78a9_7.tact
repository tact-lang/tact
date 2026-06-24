struct OptionalDeep {
    innerOpt: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract OptDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            innerOpt: null
        };
    }
}