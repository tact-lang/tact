struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract NestedOptionalStructField {
    s: OptStruct;
    init() {
        self.s = OptStruct{ x: null, y: null };
    }
}
