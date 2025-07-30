struct NestedStrings {
    s1: String;
    s2: String?;
}

struct TopStruct {
    inner: NestedStrings;
    val: Int;
}

contract NestedStringStructs {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            inner: NestedStrings{s1:"hi", s2:null},
            val: 77
        };
    }
}