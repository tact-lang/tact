contract EmptyParamsField {
    foo: Int;

    init() {
        self.foo = 7;
    }
}

contract ParamContract(foo: Int) {
    // should conflict within one file
}
