struct NestOne {
    n: Int; 
}

struct NestTwo {
    a: NestOne;
}

struct NestThree {
    b: NestTwo;
}

struct NestFour {
    c: NestThree;
}

struct NestFive {
    d: NestFour;
}

contract DeepFive {
    field: NestFive;
    init() {
        self.field = NestFive{
            d: NestFour{
                c: NestThree{
                    b: NestTwo{
                        a: NestOne{n: 99}
                    }
                }
            }
        };
    }
}
