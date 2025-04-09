struct MultiLevel {
    s1: SLevel1;
    s2: SLevel1;
}

struct SLevel1 {
    nested: SLevel2;
    more: SLevel2;
}

struct SLevel2 {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiLevelTest {
    data: MultiLevel;

    init() {
        self.data = MultiLevel{
            s1: SLevel1{
                nested: SLevel2{x:1,y:true,z:"a"},
                more: SLevel2{x:2,y:false,z:"b"}
            },
            s2: SLevel1{
                nested: SLevel2{x:3,y:true,z:"c"},
                more: SLevel2{x:4,y:false,z:"d"}
            }
        };
    }
}