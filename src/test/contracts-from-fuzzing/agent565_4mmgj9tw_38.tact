struct SLevel4 {
    z: Int;
}
struct SLevel3 {
    y: SLevel4;
}
struct SLevel2 {
    x: SLevel3;
}
struct SLevel1 {
    w: SLevel2;
}

contract FourNest {
    nested: SLevel1;
    init() {
        self.nested = SLevel1{
            w: SLevel2{
                x: SLevel3{
                    y: SLevel4{
                        z: 99
                    }
                }
            }
        };
    }
}