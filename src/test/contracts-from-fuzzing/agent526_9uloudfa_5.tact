struct NestedOptional {
    foo: Int?;
    bar: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    desc: String?;
}

contract NestedOptionals {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: 21,
            bar: InnerStruct{
                flag: true,
                desc: null,
            },
        };
    }

    receive() {}
}