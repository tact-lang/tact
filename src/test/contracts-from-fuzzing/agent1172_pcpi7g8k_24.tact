contract StorageOrder {
    a: Int as int8;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;

    init() {
        self.a = -7;
        self.b = true;
        self.c = "ok";
        self.d = null;
        self.e = null;
    }
}