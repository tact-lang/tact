struct ManyLayer {
    one: Int;
    two: LayerTwo;
}
struct LayerTwo {
    three: LayerThree;
}
struct LayerThree {
    four: Int;
}

contract ComplexNest {
    nested: ManyLayer;

    init() {
        self.nested = ManyLayer{
            one: 1,
            two: LayerTwo{
                three: LayerThree{
                    four: 4
                }
            }
        };
    }
}