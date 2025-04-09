struct StructA {
    field1: Int;
    field2: String;
}

struct StructB {
    nestedA: StructA;
    flag: Bool;
}

struct StructC {
    nestedB: StructB;
    msg: String;
}

contract DeepNestedTest {
    val: StructC;

    init() {
        self.val = StructC{
            nestedB: StructB{
                nestedA: StructA{field1: 42, field2: "deep"},
                flag: true
            },
            msg: "hi"
        };
    }
}