contract OptionalAfterInit {
    myInt: Int?;
    myBool: Bool?;

    init() {
        self.myInt = null;
        self.myBool = null;
    }
}