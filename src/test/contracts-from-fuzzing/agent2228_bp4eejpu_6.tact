struct NestedOptionalInStruct {
    val: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    flag: Bool;
}

contract NestedOptionalStructField {
    data: NestedOptionalInStruct;

    init() {
        self.data = NestedOptionalInStruct{
            val: null,
            sub: null,
        };
    }
}
