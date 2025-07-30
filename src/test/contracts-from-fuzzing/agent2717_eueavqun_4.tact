struct DeeplyNested {
    sub: Sub1;
}

struct Sub1 {
    sub: Sub2;
}

struct Sub2 {
    sub: Sub3;
}

struct Sub3 {
    sub: Sub4;
}

struct Sub4 {
    sub: Sub5;
}

struct Sub5 {
    val: Int;
}

contract DeepContract {
    dn: DeeplyNested;

    init() {
        self.dn = DeeplyNested{
            sub: Sub1{
                sub: Sub2{
                    sub: Sub3{
                        sub: Sub4{
                            sub: Sub5{val: 42}
                        }
                    }
                }
            }
        };
    }
}