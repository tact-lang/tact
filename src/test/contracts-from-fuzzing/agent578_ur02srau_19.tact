struct InnerD {
    d: String?;
}
struct InnerC {
    c: InnerD;
}
struct InnerB {
    b: InnerC;
}
struct InnerA {
    a: InnerB;
}

contract ChainDeepOption {
    deep: InnerA;

    init() {
        self.deep = InnerA{
            a: InnerB{
                b: InnerC{
                    c: InnerD{
                        d: "dee"
                    }
                }
            }
        };
    }
}