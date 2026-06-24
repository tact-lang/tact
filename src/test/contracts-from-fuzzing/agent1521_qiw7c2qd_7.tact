struct DeeplyNested {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract ManyOptionals {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: DeeplyNested?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }
}