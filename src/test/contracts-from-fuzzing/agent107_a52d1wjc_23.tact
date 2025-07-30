struct SOpt {
    foo: Int?;
}

struct SNestOpt {
    bar: SOpt?;
}

contract OptionalStruct {
    nested: SNestOpt;

    init() {
        self.nested = SNestOpt{ bar: null };
    }
}