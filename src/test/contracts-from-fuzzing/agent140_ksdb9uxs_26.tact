struct DeeplyOptional {
    foo: Int?;
    bar: String?;
}

struct OptRec {
    nested: DeeplyOptional?;
}

contract OptionalStructInStructOpt {
    data: OptRec;

    init() {
        self.data = OptRec{
            nested: null
        };
    }
}