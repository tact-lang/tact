struct StructA {
    v1: Int;
    v2: Bool;
    v3: Address?;
}

struct StructB {
    sb1: StructA;
    sb2: StructA;
    sb3: StructA;
}

contract MultiNested {
    data: StructB;

    init() {
        self.data = StructB{
            sb1: StructA{v1:1,v2:true,v3:null},
            sb2: StructA{v1:2,v2:false,v3:null},
            sb3: StructA{v1:3,v2:true,v3:null}
        };
    }
}