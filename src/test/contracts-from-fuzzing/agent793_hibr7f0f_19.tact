struct OptStruct {
    a: Int?;
    b: Bool?;
}

contract NestedOptStruct {
    s: OptStruct?;
    init() {
        self.s = null;
    }
}