struct NestedA {
    intA: Int;
    boolA: Bool;
}

struct NestedB {
    strB: String;
    optNestedA: NestedA?;
}

contract DeepNestedContract {
    nestedB: NestedB;

    init() {
        self.nestedB = NestedB{
            strB: "test",
            optNestedA: NestedA{intA: 1, boolA: true},
        };
    }
}