struct NestingLevel1 {
    f1: Int;
}

struct NestingLevel2 {
    field: NestingLevel1;
}

struct NestingLevel3 {
    level2: NestingLevel2;
}

struct NestingLevel4 {
    level3: NestingLevel3;
}

struct NestingLevel5 {
    level4: NestingLevel4;
}

contract FiveDeepStructTest {
    data: NestingLevel5;

    init() {
        self.data = NestingLevel5{
            level4: NestingLevel4{
                level3: NestingLevel3{
                    level2: NestingLevel2{
                        field: NestingLevel1{ f1: 42 }
                    }
                }
            }
        };
    }
}
