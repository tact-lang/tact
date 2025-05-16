struct NestedMore {
    one: Int;
    two: Bool;
    sub: SubNest;
}

struct SubNest {
    val: String;
    deeper: Deepest;
}

struct Deepest {
    flag: Bool?;
    note: String?;
}

contract DeepChain {
    data: NestedMore;

    init() {
        self.data = NestedMore{
            one: 100,
            two: true,
            sub: SubNest{
                val: "x",
                deeper: Deepest{
                    flag: null,
                    note: null
                }
            }
        };
    }
}