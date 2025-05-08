struct OptStruct {
    num: Int?;
    flag: Bool?;
}

contract OptionalVars {
    val: OptStruct;

    init() {
        self.val = OptStruct{ num: null, flag: null };
    }

    receive() {
        self.val = OptStruct{ num: 123, flag: true };
    }
}