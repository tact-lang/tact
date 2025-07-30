struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

contract MixedTypes {
    field: ManyFields;

    init() {
        self.field = ManyFields{
            f1:1,
            f2:false,
            f3:"hi",
            f4:null,
            f5:true,
            f6:null
        };
    }
}