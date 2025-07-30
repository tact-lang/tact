struct X1 { val: Int }
struct X2 { val: Int }
struct X3 { val: Int }
struct X4 { val: Int }
struct X5 { val: Int }
struct X6 { val: Int }
struct X7 { val: Int }
struct X8 { val: Int }
struct X9 { val: Int }
struct X10 { val: Int }

contract Test {
    s1: X1;
    s2: X2;
    s3: X3;
    s4: X4;
    s5: X5;
    s6: X6;
    s7: X7;
    s8: X8;
    s9: X9;
    s10: X10;
    init() {
        self.s1 = X1{val:1};
        self.s2 = X2{val:2};
        self.s3 = X3{val:3};
        self.s4 = X4{val:4};
        self.s5 = X5{val:5};
        self.s6 = X6{val:6};
        self.s7 = X7{val:7};
        self.s8 = X8{val:8};
        self.s9 = X9{val:9};
        self.s10= X10{val:10};
    }
}