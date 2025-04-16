struct NestedA {
    foo: Int;
    bar: Bool?;
}

struct NestedB {
    nestedA: NestedA;
    val: String?;
}

contract DeepNest {
    data: NestedB;

    init() {
        self.data = NestedB{
            nestedA: NestedA{ foo: 1, bar: true },
            val: "hello"
        };
    }
}