struct OptionalFieldStruct {
    a: Int?;
    b: Bool?;
}

contract NestedOptStruct {
    s: OptionalFieldStruct?;
    init() {
        self.s = null;
    }
}