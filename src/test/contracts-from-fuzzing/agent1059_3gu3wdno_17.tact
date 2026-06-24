struct SBool {
    x: Bool;
    y: Bool;
    z: Bool;
}

struct OuterBool {
    first: SBool;
    second: SBool;
    third: SBool;
}

contract ManyBools {
    f: OuterBool;
    init() {
        self.f = OuterBool{
            first: SBool{ x:true,y:false,z:true },
            second: SBool{ x:true,y:true,z:false },
            third: SBool{ x:false,y:true,z:true }
        };
    }
}