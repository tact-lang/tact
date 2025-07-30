struct OptStruct {
    foo: Int?;
    bar: Bool;
}

contract OptDefault {
    st: OptStruct;

    init() {
        self.st = OptStruct{ foo:null, bar:true };
    }
}