struct Small { x: Int; y: Bool; z: Int?; }

contract Bulk {
    f01: Small;
    f02: Small;
    f03: Small;
    f04: Small;
    f05: Small;
    f06: Small;
    f07: Small;
    f08: Small;
    f09: Small;
    f10: Small;

    init() {
        self.f01 = Small{ x:1, y:true, z:null };
        self.f02 = Small{ x:2, y:false, z:3 };
        self.f03 = Small{ x:4, y:true, z:null };
        self.f04 = Small{ x:5, y:true, z:6 };
        self.f05 = Small{ x:7, y:false, z:null };
        self.f06 = Small{ x:8, y:true, z:9 };
        self.f07 = Small{ x:10, y:false, z:null };
        self.f08 = Small{ x:11, y:true, z:12 };
        self.f09 = Small{ x:13, y:false, z:null };
        self.f10 = Small{ x:14, y:true, z:15 };
    }
}
