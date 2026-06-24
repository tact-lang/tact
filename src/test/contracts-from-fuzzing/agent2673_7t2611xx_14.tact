struct NestedOptionalStruct {
    x: Int?;
    y: InnerStruct?;
}

struct InnerStruct {
    z: String?;
}

contract NestedOptHolder {
    val: NestedOptionalStruct;

    init() {
        self.val = NestedOptionalStruct{ x: null, y: InnerStruct{ z: null } };
    }
}