struct NestedStr {
    field1: String;
    field2: String?;
}

struct OuterStr {
    n1: NestedStr;
    n2: NestedStr;
}

contract NestedStringContract {
    val: OuterStr;

    init() {
        self.val = OuterStr{
            n1: NestedStr{field1:"one", field2:null},
            n2: NestedStr{field1:"two", field2:null}
        };
    }
}
