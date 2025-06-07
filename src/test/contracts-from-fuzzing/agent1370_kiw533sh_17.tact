contract MixedSerialization {
    intU4: Int as uint4;
    intI257: Int as int257;
    boolVal: Bool;
    strVal: String;

    init() {
        self.intU4 = 7;
        self.intI257 = -1000;
        self.boolVal = false;
        self.strVal = "hi";
    }
}