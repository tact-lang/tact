struct MultiLayer {
    one: Int;
    two: LayerTwo;
}

struct LayerTwo {
    a: Bool;
    b: LayerThree;
}

struct LayerThree {
    s: String;
}

contract NestedMulti {
    val: MultiLayer;

    init() {
        self.val = MultiLayer{
            one: 1,
            two: LayerTwo{
                a: true,
                b: LayerThree{
                    s: "deep"
                }
            }
        };
    }
}
