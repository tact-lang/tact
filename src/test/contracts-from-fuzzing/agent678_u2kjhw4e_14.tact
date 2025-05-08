contract DefaultOptional {
    optVal1: Int?;
    optVal2: Bool?;
    optVal3: String?;
    optVal4: Address?; // should be rejected as Address? isn't supported? Test it.
    init() {
        self.optVal1 = null;
        self.optVal2 = null;
        self.optVal3 = null;
        self.optVal4 = null;
    }
}