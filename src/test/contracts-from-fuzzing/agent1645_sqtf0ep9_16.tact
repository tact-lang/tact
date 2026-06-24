struct BaseStruct {
    a: Int;
}

struct Wrapper1 {
    bs: BaseStruct;
}

struct Wrapper2 {
    w1: Wrapper1;
}

contract VeryDeepNesting {
    w2: Wrapper2;

    init() {
        self.w2 = Wrapper2{
            w1: Wrapper1{
                bs: BaseStruct{ a:42 }
            }
        };
    }
}