struct Alpha {
    a: Int;
    b: Beta;
}

struct Beta {
    c: Int;
    d: Gamma;
}

struct Gamma {
    e: Int;
    f: Delta;
}

struct Delta {
    g: Int;
    h: Epsilon;
}

struct Epsilon {
    i: Int;
}

contract DeepChain {
    var: Alpha;

    init() {
        self.var = Alpha{
            a:1, b:Beta{
                c:2,d:Gamma{
                    e:3,f:Delta{
                        g:4,h:Epsilon{
                            i:5
                        }
                    }
                }
            }
        };
    }
}
