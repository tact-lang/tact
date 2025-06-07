struct DeepOptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract MixOptionalBase {
    a: Int?;
    b: Bool?;
    c: String?;
    rec: DeepOptionalPrimitives;

    init() {
        self.a = null;
        self.b = true;
        self.c = "tt";
        self.rec = DeepOptionalPrimitives{
            intOpt: 55,
            boolOpt: null,
            strOpt: null
        };
    }
}
