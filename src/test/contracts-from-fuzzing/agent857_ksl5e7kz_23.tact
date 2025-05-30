struct MultiLayer {
    nested1: NestedOne;
    nested2: NestedTwo;
}

struct NestedOne {
    val: Int;
    text: String;
}

struct NestedTwo {
    flag: Bool;
    note: String?;
}

contract TestContract {
    conf: MultiLayer = MultiLayer{
        nested1: NestedOne{ val:1, text:"" },
        nested2: NestedTwo{ flag:true, note:null }
    };
}