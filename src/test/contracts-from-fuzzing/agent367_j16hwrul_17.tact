struct StructA {
    valA: Int;
    optB: StructB?;
}

struct StructB {
    flag: Bool;
    msg: String;
}

contract NestedOptStructTest {
    storage: StructA;
    init() {
        self.storage = StructA{
            valA: 99,
            optB: null
        };
    }
}