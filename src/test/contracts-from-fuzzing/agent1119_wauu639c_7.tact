struct DeepOptional {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract TestContract {
    deep: DeepOptional?;

    init() {
        self.deep = DeepOptional{foo: null, bar: null, baz: null};
    }
}