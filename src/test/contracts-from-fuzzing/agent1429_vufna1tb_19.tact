struct ManyNested1 {
    x: Int;
}

struct ManyNested2 {
    y: ManyNested1;
}

struct ManyNested3 {
    z: ManyNested2;
}

struct ManyNested4 {
    q: ManyNested3;
}

struct ManyNested5 {
    r: ManyNested4;
}

struct ManyNested6 {
    s: ManyNested5;
}

contract VeryDeep {
    val: ManyNested6;

    init() {
        self.val = ManyNested6{
            s: ManyNested5{
                r: ManyNested4{
                    q: ManyNested3{
                        z: ManyNested2{
                            y: ManyNested1{
                                x: 100
                            }
                        }
                    }
                }
            }
        };
    }
}
