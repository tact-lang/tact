struct OptionalBoolNested {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract OptionalBools {
    nested: OptionalBoolNested;

    init() {
        self.nested = OptionalBoolNested {
            a:true,
            b:null,
            c:false
        };
    }
}