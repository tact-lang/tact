struct A1 { a: Int }
struct A2 { a: Int }
struct A3 { a: Int }
struct A4 { a: Int }
struct A5 { a: Int }
struct A6 { a: Int }
struct A7 { a: Int }
struct A8 { a: Int }
struct A9 { a: Int }
struct A10 { a: Int }

contract LotsOfStructs {
    f1: A1;
    f2: A2;
    f3: A3;
    f4: A4;
    f5: A5;
    f6: A6;
    f7: A7;
    f8: A8;
    f9: A9;
    f10: A10;
    
    init() {
        self.f1 = A1{a: 1};
        self.f2 = A2{a: 2};
        self.f3 = A3{a: 3};
        self.f4 = A4{a: 4};
        self.f5 = A5{a: 5};
        self.f6 = A6{a: 6};
        self.f7 = A7{a: 7};
        self.f8 = A8{a: 8};
        self.f9 = A9{a: 9};
        self.f10 = A10{a: 10};
    }
}