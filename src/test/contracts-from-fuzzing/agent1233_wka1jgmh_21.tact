struct LayerOne {
    a: Int;
    b: Int;
}

struct LayerTwo {
    x: LayerOne;
    y: LayerOne;
}

struct LayerThree {
    m: LayerTwo;
    n: LayerTwo;
}

contract MultiNestedWide {
    s: LayerThree;

    init() {
        self.s = LayerThree{
            m: LayerTwo{
                x: LayerOne{a: 1, b:2},
                y: LayerOne{a: 3, b:4}
            },
            n: LayerTwo{
                x: LayerOne{a: 5, b:6},
                y: LayerOne{a: 7, b:8}
            }
        };
    }
}