struct OuterStruct {
    s1: String;
    s2: InnerStruct;
}

struct InnerStruct {
    i: Int;
    flag: Bool;
}

contract NestedTypes {
    outer: OuterStruct;
    init() {
        self.outer = OuterStruct{
            s1:"hello",
            s2:InnerStruct{i:7,flag:true}
        };
    }
}