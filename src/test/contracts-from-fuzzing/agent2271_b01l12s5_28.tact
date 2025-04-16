contract ManyOptionals {
    n1: Int?;
    n2: Int?;
    n3: Int?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    s1: String?;
    s2: String?;
    s3: String?;
    a1: Address?;
    a2: Address?;
    a3: Address?;

    init() {
        self.n1 = 1;
        self.n2 = null;
        self.n3 = 2;
        self.b1 = true;
        self.b2 = null;
        self.b3 = false;
        self.s1 = "a";
        self.s2 = null;
        self.s3 = "b";
        self.a1 = myAddress();
        self.a2 = null;
        self.a3 = myAddress();
    }
}