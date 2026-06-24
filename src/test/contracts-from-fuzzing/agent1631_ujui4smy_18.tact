struct InnerMost {
    num: Int;
}

struct MiddleLayer {
    nested: InnerMost;
}

struct OuterStruct {
    wrap: MiddleLayer;
}

contract ChainStruct {
    big: OuterStruct;

    init() {
        self.big = OuterStruct{
            wrap: MiddleLayer{
                nested: InnerMost{ num: 42 }
            }
        };
    }
}