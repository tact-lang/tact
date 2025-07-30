contract SerializationMix {
    u1: Int as uint3 = 3;
    u2: Int as uint7 = 7;
    u3: Int as uint13 = 13;
    u4: Int as uint25 = 25;
    u5: Int as uint51 = 51;

    init() {
        self.u1 = 2;
        self.u2 = 6;
        self.u3 = 12;
        self.u4 = 24;
        self.u5 = 50;
    }
}