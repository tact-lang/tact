struct NestedWithOptionals {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int?;
    b: Bool?;
}

contract OptionalDeep {
    data: NestedWithOptionals?;

    init() {
        self.data = NestedWithOptionals{
            inner: InnerStruct{
                a: null,
                b: true,
            },
        };
    }
}