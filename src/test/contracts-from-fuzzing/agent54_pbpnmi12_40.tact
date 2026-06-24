contract ContrWithSerializable {
    a: Int as uint5;
    b: Int as uint255;

    init() {
        self.a = 7;
        self.b = 100;
    }
}