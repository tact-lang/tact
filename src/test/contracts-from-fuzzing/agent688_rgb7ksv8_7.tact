struct InnerMost {
    val: Int?;
}

struct Inner {
    deep: InnerMost?;
}

struct Outer {
    nest: Inner?;
}

contract DeepNestedOptional {
    st: Outer;

    init() {
        self.st = Outer{
            nest: Inner{
                deep: InnerMost{
                    val: 123
                }
            }
        };
    }
}
