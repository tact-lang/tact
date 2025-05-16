struct SubStruct { x: Int; y: Int }

struct TopStruct { 
    s1: SubStruct;
    s2: SubStruct;
    s3: SubStruct;
}

contract ThreeSubs {
    val: TopStruct;

    init() {
        self.val = TopStruct{
            s1: SubStruct{ x:1, y:2 },
            s2: SubStruct{ x:3, y:4 },
            s3: SubStruct{ x:5, y:6 }
        };
    }
}