struct DeepStruct {
    inn: Int;
    opt: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract ManyOptionalSiblings {
    v1: DeepStruct;
    v2: DeepStruct;
    v3: DeepStruct;

    init() {
        self.v1 = DeepStruct{ inn: 1, opt: null, opt2: null, opt3: null };
        self.v2 = DeepStruct{ inn: 2, opt: null, opt2: null, opt3: null };
        self.v3 = DeepStruct{ inn: 3, opt: null, opt2: null, opt3: null };
    }
}