contract OptPrimitiveInit {
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optInt = null;
        self.optBool = true; // test optional bool assigned true directly
    }
}