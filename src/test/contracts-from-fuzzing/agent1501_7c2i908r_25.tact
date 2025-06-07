struct DeepOptional {
    inner: MiddleOpt?;
}

struct MiddleOpt {
    leaf: Int?;
}

contract TestContract {
    foo: DeepOptional;

    init() {
        self.foo = DeepOptional{
            inner: MiddleOpt{
                leaf: null
            }
        };
    }
}