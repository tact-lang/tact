struct MultipleOptionalLayers {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract OptionLayers {
    m1: MultipleOptionalLayers;
    m2: MultipleOptionalLayers;

    init() {
        self.m1 = MultipleOptionalLayers{ one:null, two:true, three:null };
        self.m2 = MultipleOptionalLayers{ one:123, two:null, three:"abc" };
    }
}
