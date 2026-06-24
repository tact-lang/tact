struct InnerMost {
    flag: Bool?;
}

struct OuterWithOptional {
    val: Int;
    nested: InnerMost;
}

contract OptionalInNested {
    deep: OuterWithOptional;

    init() {
        self.deep = OuterWithOptional{
            val: 123,
            nested: InnerMost{
                flag: null
            }
        };
    }
}