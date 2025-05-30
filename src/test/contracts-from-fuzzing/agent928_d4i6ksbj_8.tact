contract OptionalTopLevel {
    oInt: Int?;
    oBool: Bool?;
    oString: String?;

    init() {
        self.oInt = null;
        self.oBool = true;
        self.oString = null;
    }
}