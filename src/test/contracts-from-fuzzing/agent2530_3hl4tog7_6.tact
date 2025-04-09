contract LongList {
    a: Int; b: Bool; c: String; d: Int; e: Bool; f: String; g: Address; h: Int; i: Bool; j: String;
    k: Int; l: Bool; m: String; n: Int; o: Bool; p: String; q: Address; r: Int; s: Bool; t: String;

    init() {
        self.a = 1; self.b = true; self.c = "c"; self.d = 2; self.e = false; self.f = "f";
        self.g = myAddress();
        self.h = 3; self.i = true; self.j = "j";
        self.k = 4; self.l = false; self.m = "m"; self.n = 5; self.o = true; self.p = "p";
        self.q = myAddress();
        self.r = 6; self.s = false; self.t = "t";
    }
}