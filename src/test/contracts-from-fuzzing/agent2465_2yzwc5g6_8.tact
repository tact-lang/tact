struct ParamS {
    foo: Int;
    bar: String;
    baz: Bool;
}

contract TestContract {
    param: ParamS?;

    init() {
        self.param = null;
    }
}