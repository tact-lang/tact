contract ManyPrimitives {
    x: Int;
    y: Bool;
    z: String;
    a: Address;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;

    init() {
        self.x = 1;
        self.y = false;
        self.z = "test";
        self.a = myAddress();
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}