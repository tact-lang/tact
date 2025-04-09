struct Outermost {
    first: Int;
    second: MiddleLayer;
}

struct MiddleLayer {
    nested: InnerLayer;
    flag: Bool;
}

struct InnerLayer {
    x: Int?;
    y: Bool;
}

contract DeepMixedOption {
    deep: Outermost;

    init() {
        self.deep = Outermost{
            first:1,
            second: MiddleLayer{
                nested: InnerLayer{ x:null, y:true },
                flag: true
            }
        };
    }
}
