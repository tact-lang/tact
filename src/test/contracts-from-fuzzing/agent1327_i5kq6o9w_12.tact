struct LayerOne {
    f1: Int;
    f2: LayerTwo;
}

struct LayerTwo {
    f3: Int;
    f4: LayerThree;
}

struct LayerThree {
    f5: Int;
    f6: LayerFour;
}

struct LayerFour {
    f7: Int;
    f8: LayerFive;
}

struct LayerFive {
    f9: Int;
}

contract ComplexNest {
    storage: LayerOne;

    init() {
        self.storage = LayerOne{
            f1:1,
            f2:LayerTwo{
                f3:2,
                f4:LayerThree{
                    f5:3,
                    f6:LayerFour{
                        f7:4,
                        f8:LayerFive{f9:5}
                    }
                }
            }
        };
    }
}