struct DeeplyNested {
    innermost: Int?;
}

struct Middle {
    nested: DeeplyNested;
}

struct Outer {
    middle: Middle;
}

contract ManyLevelsOfNesting {
    all: Outer;

    init() {
        self.all = Outer {
            middle: Middle {
                nested: DeeplyNested {
                    innermost: null
                }
            }
        };
    }
}