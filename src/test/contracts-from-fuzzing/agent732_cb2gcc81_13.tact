struct LargeNested {
    s1: StructPart;
    s2: StructPart;
    s3: StructPart;
}

struct StructPart {
    x: Int;
    y: Bool;
    z: String;
}

contract LargeNestedContract {
    content: LargeNested;

    init() {
        self.content = LargeNested{
            s1: StructPart{x:1,y:true,z:"a"},
            s2: StructPart{x:2,y:false,z:"b"},
            s3: StructPart{x:3,y:true,z:"c"}
        };
    }
}