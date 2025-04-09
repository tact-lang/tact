struct NestedOptStruct {
    inner: OptStruct?;
    flag: Bool;
}

struct OptStruct {
    val: Int;
}

contract StructWithOptInside {
    data: NestedOptStruct;

    init() {
        self.data = NestedOptStruct{ inner: null, flag: true };
    }
}