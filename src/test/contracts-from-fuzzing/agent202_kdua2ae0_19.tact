struct NestedOptionalStruct {
    s: InnerOptionalStruct?;
}

struct InnerOptionalStruct {
    val: Int?;
    flag: Bool?;
}

contract NestedOptionalStructStorage {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            s: null
        };
    }
}