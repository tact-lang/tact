struct DeepOptional {
    foo: Int?;
    bar: Int?;
}

contract NestedDeepOpt {
    opt: DeepOptional?;
    init() {
        self.opt = null;
    }
}