struct Tiny1 { a: Int }
struct Tiny2 { a: Int }
struct Tiny3 { a: Int }
struct Tiny4 { a: Int }
struct Tiny5 { a: Int }
struct Tiny6 { a: Int }
struct Tiny7 { a: Int }
struct Tiny8 { a: Int }
struct Tiny9 { a: Int }
struct Tiny10{ a: Int }

struct BigWrapper {
    f1: Tiny1;
    f2: Tiny2;
    f3: Tiny3;
    f4: Tiny4;
    f5: Tiny5;
    f6: Tiny6;
    f7: Tiny7;
    f8: Tiny8;
    f9: Tiny9;
    f10: Tiny10;
}

contract TestContract {
    value: BigWrapper;

    init() {
        self.value = BigWrapper{
            f1:Tiny1{a:1},f2:Tiny2{a:2},f3:Tiny3{a:3},f4:Tiny4{a:4},
            f5:Tiny5{a:5},f6:Tiny6{a:6},f7:Tiny7{a:7},f8:Tiny8{a:8},
            f9:Tiny9{a:9},f10:Tiny10{a:10}
        };
    }
}