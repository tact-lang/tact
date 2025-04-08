struct InnerStruct {
    value: Int;
}

struct OptNested {
    nested: InnerStruct?;
}

contract OptionalStructInside {
    fn: OptNested;

    init() {
        self.fn = OptNested{nested:null};
    }
}