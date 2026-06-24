struct SubNested {
    foo: Int;
    bar: Bool;
}

struct Nested {
    baz: SubNested;
    s: String;
    flag: Bool?;
    val: Int?;
}

contract StructOptionals {
    item: Nested?;

    init() {
        self.item = Nested{
            baz: SubNested{
                foo: 5,
                bar: true,
            },
            s: "test",
            flag: null,
            val: null,
        };
    }
}