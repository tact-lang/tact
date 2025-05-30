struct SLevel3 {
    z: Int;
}

struct SLevel2 {
    y: SLevel3;
}

struct SLevel1 {
    x: SLevel2;
}

contract Levels {
    data: SLevel1;

    init() {
        self.data = SLevel1{
            x: SLevel2{
                y: SLevel3{z:42}
            }
        };
    }
}