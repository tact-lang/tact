struct DeeplyNested {
    one: Int;
    two: Int?;
    three: Bool;
    four: String;
}

struct MiddleLayer {
    nested: DeeplyNested;
    optionalNested: DeeplyNested?;
}

contract VariedNested {
    f: MiddleLayer;

    init() {
        self.f = MiddleLayer{
            nested: DeeplyNested{
                one: 1, two:null, three:true, four:"x"
            },
            optionalNested: null
        };
    }
}