struct SLevel1 {
    a: SLevel2;
}

struct SLevel2 {
    b: SLevel3;
}

struct SLevel3 {
    c: Int?;
    d: SLevel4;
}

struct SLevel4 {
    e: Int;
}

contract TestContract {
    data: SLevel1;

    init() {
        self.data = SLevel1{
            a: SLevel2{
                b: SLevel3{
                    c: null,
                    d: SLevel4{ e: 123 }
                }
            }
        };
    }
}