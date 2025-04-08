struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptStructTest {
    opt: OptStruct;

    init() {
        self.opt = OptStruct{foo: null, bar: true, baz: null};
    }
}