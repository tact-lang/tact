// many nested structs where innermost contains many small fields
struct InnerMost {
    a: Int;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
}

struct Level1 {
    inner: InnerMost;
}
struct Level2 {
    lv1: Level1;
}
struct Level3 {
    lv2: Level2;
}
contract TestContract {
    nest: Level3 = Level3{
        lv2: Level2{
            lv1: Level1{
                inner: InnerMost{
                    a: 42,
                    b: true,
                    c: false,
                    d: true,
                    e: false,
                    f: true,
                    g: false
                }
            }
        }
    };

    init() {
        self.nest = Level3{
            lv2: Level2{
                lv1: Level1{
                    inner: InnerMost{
                        a: 99,
                        b: false,
                        c: true,
                        d: false,
                        e: true,
                        f: false,
                        g: true
                    }
                }
            }
        };
    }
}
