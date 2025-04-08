struct DeeplyNested3 {
    d: Int;
}

struct DeeplyNested2 {
    c: DeeplyNested3;
}

struct DeeplyNested1 {
    b: DeeplyNested2;
}

contract VeryDeepContract {
    a: DeeplyNested1;

    init() {
        self.a = DeeplyNested1{
            b: DeeplyNested2{
                c: DeeplyNested3{ d: 99 }
            }
        };
    }
}