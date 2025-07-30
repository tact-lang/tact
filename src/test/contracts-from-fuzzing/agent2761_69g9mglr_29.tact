struct A1 { x: Int; y: Bool; z: Int?; }

struct A2 {
    f1: A1;
    f2: A1;
    f3: A1;
    f4: A1;
}

contract NestedBigTuple {
    nested: A2;
    init() {
        self.nested = A2{
            f1: A1{x:1,y:true,z:null},
            f2: A1{x:2,y:false,z:null},
            f3: A1{x:3,y:true,z:null},
            f4: A1{x:4,y:false,z:null}
        };
    }
}
