struct BoolNesting {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

struct InnerStruct {
    name: String;
    nestedBools: BoolNesting;
}

contract TestDeep {
    val: InnerStruct;

    init() {
        self.val = InnerStruct {
            name: "hello",
            nestedBools: BoolNesting{
                flag1:true, flag2:false, flag3:true
            }
        };
    }
}