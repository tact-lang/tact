struct OptRec {
    nested: RecStruct?;
}

struct RecStruct {
    foo: Int;
    bar: Bool?;
}

contract RecOpt {
    field: OptRec;

    init() {
        self.field = OptRec{
            nested: RecStruct{
                foo: 42,
                bar: null
            }
        };
    }
}