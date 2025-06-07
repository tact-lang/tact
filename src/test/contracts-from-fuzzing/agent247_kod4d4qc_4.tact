struct Deep {
    val: Int;
    optInner: Inner?;
}

struct Inner {
    flag: Bool;
    name: String;
}

contract DeepNest {
    nested: Deep;
    init() {
        self.nested = Deep{
            val: 42,
            optInner: Inner{
                flag: true,
                name: "deep"
            }
        };
    }
}