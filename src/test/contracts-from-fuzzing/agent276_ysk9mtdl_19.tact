struct DeepStruct {
    a: Int;
    b: Middle;
}

struct Middle {
    b1: Int;
    b2: VeryInner;
}

struct VeryInner {
    c: Int;
}

contract RepeatedDeepInit {
    p: DeepStruct;

    init() {
        self.p = DeepStruct{
            a: 1, 
            b: Middle{b1: 2, b2: VeryInner{c: 3}}
        };
    }
}
