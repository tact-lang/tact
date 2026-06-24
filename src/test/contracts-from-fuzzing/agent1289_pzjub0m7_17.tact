contract MixPrimitivesStorage {
    x: Int;
    y: Bool;
    z: String;
    w: Int as uint32;
    u: Address;
    v: Bool;

    init() {
        self.x = 1;
        self.y = true;
        self.z = "hello";
        self.w = 500;
        self.u = myAddress();
        self.v = false;
    }
}