struct SubStruct {
    val: Int;
    flag: Bool?;
    note: String;
}

struct Primary {
    a: Int;
    b: Bool;
    sub: SubStruct;
    c: Bool?;
}

contract NestedMultiOptional {
    field: Primary;

    init() {
        self.field = Primary{
            a:1, b:true, c:null,
            sub: SubStruct{ val:2, flag: null, note:"n" }
        };
    }
}
