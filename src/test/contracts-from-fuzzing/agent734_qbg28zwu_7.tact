struct Deep {
    a: Int;
    b: Layer1;
}

struct Layer1 {
    c: Int;
    d: Layer2;
}

struct Layer2 {
    e: Int;
    f: Layer3;
}

struct Layer3 {
    g: Int;
    h: Layer4;
}

struct Layer4 {
    i: Int;
    j: Layer5;
}

struct Layer5 {
    k: Int;
}

contract TestContract {
    data: Deep;

    init() {
        self.data = Deep{
            a:1,
            b: Layer1{
                c:2,
                d: Layer2{
                    e:3,
                    f: Layer3{
                        g:4,
                        h: Layer4{
                            i:5,
                            j: Layer5{ k:6 }
                        }
                    }
                }
            }
        };
    }
}