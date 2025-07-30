struct InnerMost {
    val: Int?;
}

struct Middle {
    deep: InnerMost?;
}

struct Outer {
    nested: Middle?;
}

contract DeepOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Middle{
                deep: InnerMost {
                    val: 123,
                },
            },
        };
    }
}