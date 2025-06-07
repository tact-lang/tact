contract Variety {
    a: Int as uint1 = 1;
    b: Int as int3 = -1;
    c: Int as uint64 = 123456789012345;
    d: Int as int257 = -999999999999999;
    e: Int = 42; // implicit int257

    init() {
        self.a=1; self.b=-1; self.c=123; self.d=-555; self.e=777;
    }

    receive() {}
}