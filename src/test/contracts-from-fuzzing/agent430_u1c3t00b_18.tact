struct NestedMix {
    x: Int;
    y: OptionalStructs;
}

struct OptionalStructs {
    s1: Inner?;
    s2: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    data: NestedMix;

    init() {
        self.data = NestedMix{
            x: 7,
            y: OptionalStructs{
                s1: Inner{a:1,b:true},
                s2: null,
            },
        };
    }
}