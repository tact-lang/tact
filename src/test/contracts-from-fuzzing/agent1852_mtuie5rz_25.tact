struct DeepMany {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
}

struct Wrap1 {
    d: DeepMany;
}

struct Wrap2 {
    w: Wrap1;
}

struct Wrap3 {
    w: Wrap2;
}

contract ManyLayers {
    data: Wrap3;

    init() {
        self.data = Wrap3{
            w: Wrap2{
                w: Wrap1{
                    d: DeepMany{x1:1, x2:2, x3:3, x4:4, x5:5}
                }
            }
        };
    }
}