// test Int with explicit serialization on contract field
contract SerializeField {
    a: Int as uint16;
    b: Int as int64;
    c: Int as int257;

    init() {
        self.a=1000; self.b=-500; self.c=999;
    }
}