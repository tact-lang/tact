struct Deep {
    str: String;
}

struct Wrap1 {
    d: Deep;
}

struct Wrap2 {
    w: Wrap1;
}

struct Wrap3 {
    w: Wrap2;
}

struct Wrap4 {
    w: Wrap3;
}

struct Wrap5 {
    w: Wrap4;
}

contract VeryDeep {
    payload: Wrap5;
    init() {
        self.payload = Wrap5{
            w: Wrap4{
                w: Wrap3{
                    w: Wrap2{
                        w: Wrap1{
                            d: Deep{ str: "bottom" }
                        }
                    }
                }
            }
        };
    }
}
