struct Tiny1 { v1: Int }
struct Tiny2 { v2: Int }
struct Tiny3 { v3: Bool }

contract ManySmalls {
    f1: Tiny1;
    f2: Tiny2;
    f3: Tiny3;
    f4: Tiny1;
    f5: Tiny2;
    f6: Tiny3;
    f7: Tiny1;
    f8: Tiny2;
    f9: Tiny3;

    init() {
        self.f1 = Tiny1{v1:1};
        self.f2 = Tiny2{v2:2};
        self.f3 = Tiny3{v3:true};
        self.f4 = Tiny1{v1:4};
        self.f5 = Tiny2{v2:5};
        self.f6 = Tiny3{v3:false};
        self.f7 = Tiny1{v1:7};
        self.f8 = Tiny2{v2:8};
        self.f9 = Tiny3{v3:true};
    }
}