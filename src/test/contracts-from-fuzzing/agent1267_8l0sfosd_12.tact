struct SeveralStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringFieldsMany {
    f1: SeveralStrings;
    f2: SeveralStrings;
    
    init() {
        self.f1 = SeveralStrings{a:"a",b:null,c:"c",d:null};
        self.f2 = SeveralStrings{a:"x",b:null,c:"y",d:null};
    }
}

contract R {
    receive() {
        let dummy: StringFieldsMany? = null;
    }
}