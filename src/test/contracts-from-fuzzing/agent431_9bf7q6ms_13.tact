struct DT1 { f: Int; }
struct DT2 { f: Int; }
struct DT3 { f: Int; }
struct DT4 { f: Int; }
struct DT5 { f: Int; }
struct DT6 { f: Int; }
struct DT7 { f: Int; }
struct DT8 { f: Int; }
struct DT9 { f: Int; }
struct DT10 { f: Int; }

contract WideDeep {
    s1: DT1;
    s2: DT2;
    s3: DT3;
    s4: DT4;
    s5: DT5;
    s6: DT6;
    s7: DT7;
    s8: DT8;
    s9: DT9;
    s10: DT10;

    init() {
        self.s1 = DT1{f:1};
        self.s2 = DT2{f:2};
        self.s3 = DT3{f:3};
        self.s4 = DT4{f:4};
        self.s5 = DT5{f:5};
        self.s6 = DT6{f:6};
        self.s7 = DT7{f:7};
        self.s8 = DT8{f:8};
        self.s9 = DT9{f:9};
        self.s10 = DT10{f:10};
    }
}
