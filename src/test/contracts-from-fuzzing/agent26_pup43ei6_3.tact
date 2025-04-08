struct DeepNest {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
    flag: Bool;
}

struct Nested2 {
    note: String;
    val: Int?;
}

contract Test3 {
    dn: DeepNest;

    init() {
        self.dn = DeepNest{
            level1: Nested1{
                level2: Nested2{
                    note: "note",
                    val: 42,
                },
                flag: true,
            },
        };
    }
}