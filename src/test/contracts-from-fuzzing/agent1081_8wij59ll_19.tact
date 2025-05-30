struct A1 { v1: Int; }
struct A2 { v2: Int; }
struct A3 { v3: Int; }
struct A4 { v4: Int; }

contract ManyStructs {
    f1: A1;
    f2: A2;
    f3: A3;
    f4: A4;

    init() {
        self.f1 = A1{v1:1};
        self.f2 = A2{v2:2};
        self.f3 = A3{v3:3};
        self.f4 = A4{v4:4};
    }
}