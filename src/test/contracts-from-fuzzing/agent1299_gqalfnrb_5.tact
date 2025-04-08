struct SubNested {
    foo: Bool;
    bar: Int?;
}

struct Nested {
    a: Int;
    b: SubNested;
}

contract OptionalDeep {
    val: Nested?;

    init() {
        self.val = Nested{
            a: 7,
            b: SubNested{
                foo: false,
                bar: null
            }
        };
    }
}