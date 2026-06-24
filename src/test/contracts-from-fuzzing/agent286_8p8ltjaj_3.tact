struct SLevel3 {
    x: Int;
}

struct SLevel2 {
    s3: SLevel3;
}

struct SLevel1 {
    s2: SLevel2;
}

contract TestContract {
    innerMost: SLevel1;

    init() {
        self.innerMost = SLevel1{
            s2: SLevel2{
                s3: SLevel3{
                    x: 777
                }
            }
        };
    }
}