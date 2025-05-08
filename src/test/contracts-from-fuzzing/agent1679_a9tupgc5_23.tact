struct OptStruct {
    f: Int?;
}

contract AssignOptionalStructField {
    s: OptStruct;

    init() {
        self.s = OptStruct{ f: 1 };
        self.s = OptStruct{ f: null };
    }

    receive() {}
}