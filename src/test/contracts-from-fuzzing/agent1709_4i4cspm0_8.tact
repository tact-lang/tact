contract DeepOptionals {
    oi1: Int?;
    os1: String?;
    ob1: Bool?;
    oi2: Int?;
    os2: String?;
    ob2: Bool?;

    init() {
        self.oi1 = null;
        self.os1 = null;
        self.ob1 = null;
        self.oi2 = 2;
        self.os2 = "hi";
        self.ob2 = true;
    }
}