struct S {
    a: Int;
}

contract LargeList {
    s1: S; s2: S; s3: S; s4: S; s5: S; s6: S; s7: S; s8: S; s9: S; s10: S;
    s11: S; s12: S; s13: S; s14: S; s15: S; s16: S; s17: S; s18: S; s19: S; s20: S;
    init() {
        self.s1 = S{a:1}; self.s2 = S{a:2}; self.s3 = S{a:3}; self.s4 = S{a:4}; self.s5 = S{a:5};
        self.s6 = S{a:6}; self.s7 = S{a:7}; self.s8 = S{a:8}; self.s9 = S{a:9}; self.s10 = S{a:10};
        self.s11 = S{a:11}; self.s12 = S{a:12}; self.s13 = S{a:13}; self.s14 = S{a:14}; self.s15 = S{a:15};
        self.s16 = S{a:16}; self.s17 = S{a:17}; self.s18 = S{a:18}; self.s19 = S{a:19}; self.s20 = S{a:20};
    }
}