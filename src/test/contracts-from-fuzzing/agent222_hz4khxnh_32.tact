contract ManyOptNulls {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;

    receive() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}