struct NestedStructs {
    first: InnerStruct;
    second: InnerStruct;
}

struct InnerStruct {
    val: Int;
    str: String;
    flag: Bool;
}

contract TestContract {
    data: NestedStructs;

    init() {
        self.data = NestedStructs{
            first: InnerStruct{ val:1, str:"x", flag:true },
            second: InnerStruct{ val:2, str:"y", flag:false }
        };
    }
}
