contract Serializers {
    i: Int as uint32;
    j: Int as int64;
    k: Int;
    b: Bool;
    s: String;
    optI: Int?;

    init() {
        self.i = 100;
        self.j = -500;
        self.k = 12345;
        self.b = true;
        self.s = "serialize";
        self.optI = null;
    }
}