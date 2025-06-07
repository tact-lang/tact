struct BO {
    x: Int;
}

contract ManyOptFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: BO?;
    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
    }
}