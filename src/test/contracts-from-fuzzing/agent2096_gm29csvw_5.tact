struct BigNestedLevel3 {
    a: Int;
    b: Bool;
    c: Int?;
}

struct BigNestedLevel2 {
    n1: BigNestedLevel3;
    n2: BigNestedLevel3;
}

struct BigNestedLevel1 {
    x: BigNestedLevel2;
    y: BigNestedLevel2;
}

contract NestedLayersStorage {
    data: BigNestedLevel1;

    init() {
        self.data = BigNestedLevel1{
            x: BigNestedLevel2{
                n1: BigNestedLevel3{a:1,b:true,c:null},
                n2: BigNestedLevel3{a:2,b:false,c:3}
            },
            y: BigNestedLevel2{
                n1: BigNestedLevel3{a:4,b:true,c:null},
                n2: BigNestedLevel3{a:5,b:false,c:6}
            }
        };
    }
}