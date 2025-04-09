struct Inception {
    l1: Int;
    s: Second;
}

struct Second {
    l2: Int;
    t: Third;
}

struct Third {
    l3: Int;
    f: Bool?;
}

contract DeepDatum {
    inc: Inception;

    init() {
        self.inc = Inception{
            l1:1,
            s: Second{
                l2:2,
                t: Third{
                    l3:3,
                    f:true
                }
            }
        };
    }
}
