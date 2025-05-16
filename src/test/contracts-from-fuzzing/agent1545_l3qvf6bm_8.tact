contract DefaultOptionalTest {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
    }

    receive() {}
}