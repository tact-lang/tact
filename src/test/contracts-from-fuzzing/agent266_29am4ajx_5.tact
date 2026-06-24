struct NestedOptionals {
    foo: Int?;
    bar: Bool?;
}

struct OuterStruct {
    nested: NestedOptionals;
    flag: Bool;
}

contract OptionalContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: NestedOptionals{
                foo: null,
                bar: true,
            },
            flag: false,
        };
    }
}
