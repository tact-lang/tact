struct InnerMost {
    id: Int;
    flag: Bool?;
}

struct Middle {
    innerMost: InnerMost?;
    val: Int?;
}

contract DeepNulls {
    a: Middle?;
    b: Middle?;
    c: Middle?;

    init() {
        self.a = null;
        self.b = Middle{
            innerMost: null,
            val: null
        };
        self.c = Middle{
            innerMost: InnerMost{
                id: 1,
                flag: null
            },
            val: null
        };
    }
}
