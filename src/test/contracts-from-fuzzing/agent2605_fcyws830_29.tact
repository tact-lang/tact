struct OptStruct {
    val: Int?;
    flag: Bool?;
}

contract NestedOptionalsStruct {
    s: OptStruct?;

    init() {
        self.s = OptStruct{ val: null, flag: null };
    }
}
