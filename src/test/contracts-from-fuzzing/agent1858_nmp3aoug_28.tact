struct SerializeNested {
    a: Int as int64;
    b: Bool;
    c: SubStruct;
}

struct SubStruct {
    x: Int as uint4;
    y: Bool;
    z: String;
}

contract NestedSerialize {
    s: SerializeNested;
    init() {
        self.s = SerializeNested{
            a:123,b:true,c:SubStruct{ x:3,y:false,z:"hi" }
        };
    }
}