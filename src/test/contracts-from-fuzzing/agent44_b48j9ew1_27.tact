contract ManyNulls {
    f1: String?;
    f2: String?;
    f3: String?;
    f4: String?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }

    receive() {
        self.f2 = "hi";
    }
}