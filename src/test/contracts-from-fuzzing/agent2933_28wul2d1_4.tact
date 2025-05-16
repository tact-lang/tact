struct L1 {
    val1: Int;
}

struct L2 {
    s1: L1;
}

struct L3 {
    s2: L2;
}

struct L4 {
    s3: L3;
}

struct L5 {
    s4: L4;
}

contract VeryDeep {
    d: L5;

    init() {
        self.d = L5{
            s4: L4{
                s3: L3{
                    s2: L2{
                        s1: L1{ val1: 77 },
                    },
                },
            },
        };
    }
}