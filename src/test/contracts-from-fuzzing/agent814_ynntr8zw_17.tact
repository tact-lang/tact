struct DeepNested {
    a: L1;
}

struct L1 {
    b: L2;
}

struct L2 {
    c: L3;
}

struct L3 {
    d: L4;
}

struct L4 {
    e: Int;
    f: String;
    g: Bool;
}

contract VeryDeep {
    dn: DeepNested;
    
    init() {
        self.dn = DeepNested{
            a: L1{
                b: L2{
                    c: L3{
                        d: L4{
                            e: 1,
                            f: "str",
                            g: false
                        }
                    }
                }
            }
        };
    }
}