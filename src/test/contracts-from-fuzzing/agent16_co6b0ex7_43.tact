contract SerializeEdgeCases {
    a: Int as uint1;
    b: Int as int1;
    c: Int as int257;

    init() {
        self.a=1; self.b=0; self.c=42;
    }
}