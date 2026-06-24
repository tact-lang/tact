struct DeeplyNested1 {
    x: Int;
}

struct DeeplyNested2 {
    n1: DeeplyNested1;
}

struct DeeplyNested3 {
    n2: DeeplyNested2;
}

struct DeeplyNested4 {
    n3: DeeplyNested3;
}

struct DeeplyNested5 {
    n4: DeeplyNested4;
}

contract TestContract {
    nested: DeeplyNested5;

    init() {
        self.nested = DeeplyNested5 {
            n4: DeeplyNested4 {
                n3: DeeplyNested3 {
                    n2: DeeplyNested2 {
                        n1: DeeplyNested1 {
                            x: 42
                        }
                    }
                }
            }
        };
    }
}