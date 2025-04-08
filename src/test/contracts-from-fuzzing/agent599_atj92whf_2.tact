struct DeepInner {
    xx: Int?;
    yy: String?;
}

struct Middle {
    innerA: DeepInner;
    innerB: DeepInner?;
}

contract NestedOptionals {
    middle: Middle;
    init() {
        self.middle = Middle{
            innerA: DeepInner{xx: null, yy: null},
            innerB: null
        };
    }
}