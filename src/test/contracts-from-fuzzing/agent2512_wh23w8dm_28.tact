struct InnerStruct {
    n: Int;
}

contract ChangeOptional {
    opt: InnerStruct?;

    init() {
        self.opt = null;
        self.opt = InnerStruct{ n: 5 };
        self.opt = null;
    }
}