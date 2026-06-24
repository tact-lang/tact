struct OptStruct {
    i: Int?;
    b: Bool?;
}

contract TestContract {
    s1: OptStruct;
    s2: OptStruct;
    s3: OptStruct;

    init() {
        self.s1 = OptStruct{ i: null, b: null };
        self.s2 = OptStruct{ i: 5, b: true };
        self.s3 = OptStruct{ i: 999, b: false };
    }
}