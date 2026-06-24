struct NestedWithOptionals {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    first: String;
    second: NestedWithOptionals;
}

contract DeepOptionalStruct {
    f: Outer;
    init() {
        self.f = Outer{
            first: "first",
            second: NestedWithOptionals{
                a: null,
                b: true,
                c: Inner{
                    x: 42,
                    y: "nested",
                },
            },
        };
    }
}