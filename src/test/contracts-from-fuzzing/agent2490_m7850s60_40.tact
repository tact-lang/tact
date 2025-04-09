contract SerializationMix {
    a: Int as uint2;
    b: Int as int3;
    c: Int as uint5;
    d: Int as int6;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 3;
        self.d = 2;
    }
}