struct DeeplyNested {
    s1: StructOne;
}

struct StructOne {
    s2: StructTwo;
}

struct StructTwo {
    s3: StructThree;
}

struct StructThree {
    x: Int;
}

contract TestContract {
    deep: DeeplyNested;

    init() {
        self.deep = DeeplyNested{
            s1: StructOne{
                s2: StructTwo{
                    s3: StructThree{
                        x: 7
                    }
                }
            }
        };
    }
}