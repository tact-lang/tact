struct Sub {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    s: Sub;
    opt: Address?;
}

contract OptionalNested {
    val: Outer;

    init() {
        self.val = Outer{
            s: Sub{
                foo: 42,
                bar: null,
            },
            opt: null,
        };
    }
}