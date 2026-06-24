struct BoolNest {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

struct NestTwo {
    n: BoolNest;
    flag: Bool;
}

contract ManyBools {
    innerStruct: NestTwo;

    init() {
        self.innerStruct = NestTwo{
            n: BoolNest{
                b1: true,
                b2: false,
                b3: true,
            },
            flag: false,
        };
    }
}