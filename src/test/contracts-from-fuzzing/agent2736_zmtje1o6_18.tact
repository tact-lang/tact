struct MultiLayer {
    a: Int;
    b: Layer2;
}

struct Layer2 {
    c: Layer3;
}

struct Layer3 {
    d: Layer4;
}

struct Layer4 {
    e: Layer5;
}

struct Layer5 {
    f: Int;
}

contract FiveLayers {
    x: MultiLayer;

    init() {
        self.x = MultiLayer{
            a: 1,
            b: Layer2{
                c: Layer3{
                    d: Layer4{
                        e: Layer5{
                            f: 999
                        }
                    }
                }
            }
        };
    }
}