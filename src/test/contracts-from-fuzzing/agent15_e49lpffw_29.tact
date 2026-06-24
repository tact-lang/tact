// Persistent storage flat with int8 serializations
contract SerializeTest {
    a: Int as int8;
    b: Int as int8;
    c: Int as int8;
    d: Int as int8;

    init() {
        self.a = 1;
        self.b = -10;
        self.c = 127;
        self.d = -128;
    }
}