contract NestedStructsAndOptionals {
    data: StructA;

    init() {
        self.data = StructA{
            nested: StructB{
                inner: StructC{
                    value: 42,
                    text: null
                },
                flag: true
            },
            name: "hello"
        };
    }

    receive() {}
}

struct StructA {
    nested: StructB;
    name: String;
}

struct StructB {
    inner: StructC;
    flag: Bool;
}

struct StructC {
    value: Int;
    text: String?;
}