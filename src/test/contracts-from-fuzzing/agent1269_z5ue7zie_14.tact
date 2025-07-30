contract TestContract {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalStr: String?;
    optionalAddr: Address?;

    init() {
        self.optionalInt = 123;
        self.optionalBool = null;
        self.optionalStr = "hello";
        self.optionalAddr = null;
    }
}