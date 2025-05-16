struct MultiLayer {
    a: Int;
    b: Layer2;
}

struct Layer2 {
    c: Int;
    d: Layer3;
}

struct Layer3 {
    e: Int;
    f: Layer4;
}

struct Layer4 {
    g: Int;
    h: Layer5;
}

struct Layer5 {
    i: Int;
}

contract TestContract {
    m: MultiLayer;
    init() {
        self.m = MultiLayer{
            a: 1,
            b: Layer2{
                c: 2,
                d: Layer3{
                    e: 3,
                    f: Layer4{
                        g: 4,
                        h: Layer5{
                            i: 5
                        }
                    }
                }
            }
        };
    }
}