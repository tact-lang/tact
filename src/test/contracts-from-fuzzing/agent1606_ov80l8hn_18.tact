contract ManyOptionalPrimitives {
    iopt: Int?;
    bopt: Bool?;
    sopt: String?;
    aopt: Address?;

    init() {
        self.iopt = null;
        self.bopt = true;
        self.sopt = null;
        self.aopt = null;
    }
}
