contract OptionalsAtStartMiddleEnd {
    a: Int?;
    b: Int;
    c: Bool?;
    d: String;
    e: Bool?;

    init() {
        self.a=null;
        self.b=42;
        self.c=null;
        self.d="hi";
        self.e=null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
    }
}