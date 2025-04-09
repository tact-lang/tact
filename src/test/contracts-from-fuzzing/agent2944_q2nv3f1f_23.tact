struct OptionalWithNested {
    fld: Int;
    optS: String?;
    optI: Int?;
}

struct Container {
    nested: OptionalWithNested;
    label: String;
}

contract NestOptMix {
    rec: Container;

    init() {
        self.rec = Container{
            nested: OptionalWithNested{
                fld: 10,
                optS: "hello",
                optI: null
            },
            label: "x"
        };
    }
}