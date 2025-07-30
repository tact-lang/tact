struct DeeplyNestedOptionals {
    l1: Int?;
    l2: InnerLevel?;
}

struct InnerLevel {
    l3: Bool?;
    l4: String?;
}

contract NestedOpts {
    val: DeeplyNestedOptionals = DeeplyNestedOptionals{
        l1: null,
        l2: null
    };

    init() {
        self.val = DeeplyNestedOptionals{
            l1: 5,
            l2: InnerLevel{
                l3: true,
                l4: "hi"
            }
        };
    }
}
