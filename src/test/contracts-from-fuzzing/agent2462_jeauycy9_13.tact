contract MixTypes {
    i: Int;
    b: Bool;
    s: String;
    io: Int?;
    bo: Bool?;
    so: String;

    init() {
        self.i = 2;
        self.b = false;
        self.s = "hello";
        self.io = null;
        self.bo = true;
        self.so = "opt";
    }
}