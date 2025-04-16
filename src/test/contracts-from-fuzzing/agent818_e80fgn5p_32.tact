struct SLevel1 {
    field: Int;
    next: SLevel2;
}

struct SLevel2 {
    field: Int;
    next: SLevel3;
}

struct SLevel3 {
    field: Int;
    next: SLevel4;
}

struct SLevel4 {
    field: Int;
    next: SLevel5;
}

struct SLevel5 {
    field: Int;
}

contract DeepChainContract {
    chain: SLevel1;

    init() {
        self.chain = SLevel1{
            field: 1,
            next: SLevel2{
                field: 2,
                next: SLevel3{
                    field: 3,
                    next: SLevel4{
                        field: 4,
                        next: SLevel5{
                            field: 5
                        }
                    }
                }
            }
        };
    }
}