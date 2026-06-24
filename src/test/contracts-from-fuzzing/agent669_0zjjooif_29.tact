struct ANested {
    b: BNested;
}

struct BNested {
    c: CNested;
}

struct CNested {
    d: DNested;
}

struct DNested {
    e: ENested;
}

struct ENested {
    val: Int;
}

contract UltraDeep {
    deep: ANested;

    init() {
        self.deep = ANested{
            b: BNested{
                c: CNested{
                    d: DNested{
                        e: ENested{ val: 9 }
                    }
                }
            }
        };
    }
}