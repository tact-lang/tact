struct A0 { x: Int; }
struct A1 { x: Int; }
struct A2 { x: Int; }
struct A3 { x: Int; }
struct A4 { x: Int; }
struct A5 { x: Int; }
struct A6 { x: Int; }
struct A7 { x: Int; }
struct A8 { x: Int; }
struct A9 { x: Int; }

struct Big {
    s0: A0;
    s1: A1;
    s2: A2;
    s3: A3;
    s4: A4;
    s5: A5;
    s6: A6;
    s7: A7;
    s8: A8;
    s9: A9;
}

contract LotsStructs {
    data: Big;

    init() {
        self.data = Big{
            s0:A0{x:0}, s1:A1{x:1}, s2:A2{x:2}, s3:A3{x:3}, s4:A4{x:4},
            s5:A5{x:5}, s6:A6{x:6}, s7:A7{x:7}, s8:A8{x:8}, s9:A9{x:9}
        };
    }
}