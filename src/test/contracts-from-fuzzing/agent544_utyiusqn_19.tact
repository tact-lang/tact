struct DeepNest {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

struct Wrap1 { x: DeepNest; }
struct Wrap2 { x: Wrap1; }
struct Wrap3 { x: Wrap2; }
struct Wrap4 { x: Wrap3; }
struct Wrap5 { x: Wrap4; }

contract TestContract {
    w: Wrap5;

    init() {
        self.w = Wrap5{
            x: Wrap4{
                x: Wrap3{
                    x: Wrap2{
                        x: Wrap1{
                            x: DeepNest{
                                a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
                            }
                        }
                    }
                }
            }
        };
    }
}