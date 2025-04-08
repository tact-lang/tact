struct NestStr1 {
    n2: NestStr2;
}

struct NestStr2 {
    n3: NestStr3;
}

struct NestStr3 {
    n4: NestStr4;
}

struct NestStr4 {
    n5: Int;
}

contract TestContract {
    deep: NestStr1;

    init() {
        self.deep = NestStr1{
            n2: NestStr2{
                n3: NestStr3{
                    n4: NestStr4{ n5: 99 }
                }
            }
        };
    }
}