struct OptionalNested {
    o1: Bool?;
    o2: Int?;
    o3: Bool?;
}

struct Wrap {
    nested: OptionalNested;
}

contract ManyNestedOpt {
    val: Wrap;

    init() {
        self.val = Wrap{
            nested: OptionalNested{
                o1: true,
                o2: null,
                o3: false
            }
        };
    }
}