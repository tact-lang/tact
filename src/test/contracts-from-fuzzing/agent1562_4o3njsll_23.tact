contract Serializers {
    a: Int as int16;
    b: Int as uint200;
    c: Int;
    d: Bool;
    e: String;

    init() {
        self.a = -12345;
        self.b = 1234567;
        self.c = -1;
        self.d = false;
        self.e = "serialize";
    }
}
