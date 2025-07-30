struct NestedStruct {
    a: Int;
    b: Bool;
}

contract DeepOptionalStorage {
    ns_opt: NestedStruct?;
    flag_opt: Bool?;
    number_opt: Int?;

    init() {
        self.ns_opt = null;
        self.flag_opt = null;
        self.number_opt = null;
    }
}