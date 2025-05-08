struct A1 { a: Int }
struct A2 { a: Int }
struct A3 { a: Int }
struct A4 { a: Int }
struct A5 { a: Int }

contract WideFieldContract {
    f1: A1;
    f2: A2;
    f3: A3;
    f4: A4;
    f5: A5;

    init() {
        self.f1 = A1{a:1};
        self.f2 = A2{a:2};
        self.f3 = A3{a:3};
        self.f4 = A4{a:4};
        self.f5 = A5{a:5};
    }
}