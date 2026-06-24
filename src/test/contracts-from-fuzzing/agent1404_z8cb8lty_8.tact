struct SubStruct {
    x: Int;
    y: Bool?;
    z: String;
}

struct MiddleStruct {
    s1: SubStruct;
    s2: SubStruct;
}

contract NestedStructStorage {
    field: MiddleStruct;

    init() {
        self.field = MiddleStruct{
            s1: SubStruct{x:1,y:true,z:"a"},
            s2: SubStruct{x:2,y:null,z:"b"},
        };
    }
}
