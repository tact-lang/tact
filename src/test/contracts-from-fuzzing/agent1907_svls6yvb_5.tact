contract ManyDifferentFields {
    x: Int;
    y: Bool;
    name: String;
    flag1: Bool?;
    flag2: Bool;
    number: Int?;
    bigString: String?;

    init() {
        self.x = 100;
        self.y = false;
        self.name = "test";
        self.flag1 = null;
        self.flag2 = true;
        self.number = null;
        self.bigString = "hello";
    }
}