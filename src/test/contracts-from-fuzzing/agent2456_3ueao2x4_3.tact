struct Simple {
    a: Int;
    b: String;
    c: Bool;
}

contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Simple;
    f5: Int?;
    f6: String?;
    f7: Bool?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "hello";
        self.f4 = Simple{a: 5, b: "", c: true};
        self.f5 = null;
        self.f6 = null;
        self.f7 = true;
    }
}