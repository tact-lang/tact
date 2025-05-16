struct DeepOpt {
    a: Int;
    b: Bool?;
}
struct Wrapper {
    inner: DeepOpt?;
}

contract NullNestedOptional {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: null
        };
    }
}
