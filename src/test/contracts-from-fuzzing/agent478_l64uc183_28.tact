struct MultiLayer {
    foo: Int;
    bar: LayerTwo;
}

struct LayerTwo {
    baz: LayerThree;
}

struct LayerThree {
    x: Int;
    y: Bool;
    note: String?;
}

contract LayersNest {
    s: MultiLayer = MultiLayer{
        foo: 7,
        bar: LayerTwo{
            baz: LayerThree{
                x: 1,
                y: false,
                note: null
            }
        }
    };
}