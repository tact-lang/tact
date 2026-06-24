struct OptionalNested {
    nest1: Int?;
    nest2: InnerOptional?;
}

struct InnerOptional {
    foo: Int?;
    bar: Bool?;
}

contract OptNested {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            nest1: null,
            nest2: InnerOptional{ foo: null, bar: true }
        };
    }
}