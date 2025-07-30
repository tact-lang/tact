// very large contract with many fields of mixed types
contract BigTest {
    a: Int; b: String; c: Bool; d: Int?; e: Bool?; f: String?; g: Address;
    h: Int as int32; i: Int as uint64; j: Int as int128; k: Address?;
    l: Bool; m: String; n: Int; o: Bool; p: String;

    init() {
        self.a = 1;
        self.b = "b";
        self.c = true;
        self.d = null;
        self.e = false;
        self.f = "str";
        self.g = myAddress();
        self.h = -1000;
        self.i = 100000;
        self.j = -999999;
        self.k = null;
        self.l = true;
        self.m = "m";
        self.n = 123;
        self.o = false;
        self.p = "p";
    }
}
