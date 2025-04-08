struct DeeplyOptional {
    foo: Int?;
    bar: Bool?;
    str: String?;
}

contract OptionalFieldsMany {
    o1: DeeplyOptional?;
    o2: DeeplyOptional?;
    o3: DeeplyOptional;
    
    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = DeeplyOptional{ foo: null, bar: null, str: null };
    }
}