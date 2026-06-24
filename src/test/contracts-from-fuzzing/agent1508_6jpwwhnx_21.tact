struct SN {
    x: Int as uint1;
    y: Int as uint2;
    z: Int as uint3;
    a: Int as uint4;
    b: Int as uint5;
    c: Int as uint6;
    d: Int as uint7;
    e: Int as uint8;
}

struct Wrap {
    s1: SN;
    s2: SN;
    s3: SN;
    s4: SN;
}

contract TestContract {
    bigWrap: Wrap;

    init() {
        self.bigWrap = Wrap{
            s1: SN{ x:1,y:2,z:3,a:4,b:5,c:6,d:7,e:8 },
            s2: SN{ x:1,y:2,z:3,a:4,b:5,c:6,d:7,e:8 },
            s3: SN{ x:1,y:2,z:3,a:4,b:5,c:6,d:7,e:8 },
            s4: SN{ x:1,y:2,z:3,a:4,b:5,c:6,d:7,e:8 }
        };
    }
}