struct OptStruct {
    a: Int;
    b: String?;
}

contract OptionalNestedStruct {
    nestOpt: OptStruct?;

    init() {
        self.nestOpt = OptStruct{a:5, b:null};
    }
}