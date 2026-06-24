contract MixTypes {
    i: Int as int16;
    j: Int as uint8;
    f: Bool;
    s: String;
    o: Int?;

    init() {
        self.i = -45;
        self.j = 200;
        self.f = true;
        self.s = "hi";
        self.o = null;
    }
}