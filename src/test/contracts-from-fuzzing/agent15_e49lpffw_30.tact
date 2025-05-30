// Persistent storage flat with small uints
contract SerializeUint {
    a: Int as uint3;
    b: Int as uint7;
    c: Int as uint12;

    init() {
        self.a = 7;
        self.b = 127;
        self.c = 4095;
    }
}