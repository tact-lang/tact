struct OptStruct {
    field: Int?;
}

contract OptNestedStruct {
    opt: OptStruct?;
    init() {
        self.opt = null;
    }
}