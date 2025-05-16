contract NestedOptionals {
    optStruct: StructOne?;
    init() {
        self.optStruct = null;
    }
}

struct StructOne {
    val: Int;
    flag: Bool;
}