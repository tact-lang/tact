struct DeepNested {
    n: Nested;
    val: Int;
}

struct Nested {
    foo: Int;
    deep: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: Address;
    s: String;
}

contract Test {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            val: 99,
            n: Nested{
                foo: 7,
                deep: Inner{
                    a: 1,
                    b: true,
                    c: myAddress(),
                    s: "str"
                }
            }
        };
    }

    receive() {}
}