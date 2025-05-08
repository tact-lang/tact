struct GroupA {
    x: Int;
    y: Bool;
    z: Int?;
}

struct GroupB {
    flag: Bool;
    n: Int?;
}

contract StructArraySim {
    a1: GroupA;
    a2: GroupA;
    b1: GroupB;
    b2: GroupB;

    init() {
        self.a1 = GroupA{ x:1, y:true, z:null };
        self.a2 = GroupA{ x:2, y:false, z:5 };
        self.b1 = GroupB{ flag:false, n:null };
        self.b2 = GroupB{ flag:true, n:7 };
    }
}