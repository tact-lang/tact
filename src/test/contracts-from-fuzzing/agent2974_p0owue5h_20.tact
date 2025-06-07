// Test contract with large number of mixed fields, incl optional primitives and struct
struct Data {
    val: Int;
    flag: Bool;
}

contract BigMix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    data: Data;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = 2;
        self.f = false;
        self.g = -1;
        self.h = null;
        self.data = Data{ val: 42, flag: true };
    }
}