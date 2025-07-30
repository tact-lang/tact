struct InnerMost {
    deep: Int;
}

struct Middle {
    nested: InnerMost;
}

struct Outer {
    top: Middle;
}

contract LayerCake {
    store: Outer;

    init() {
        self.store = Outer{
            top: Middle{
                nested: InnerMost{
                    deep: 12345
                }
            }
        };
    }
}