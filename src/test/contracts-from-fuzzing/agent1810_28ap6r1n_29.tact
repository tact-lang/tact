struct In1 { a: Int }
struct In2 { a: Int }
struct In3 { a: Int }

contract ManyStructsFields {
    f1: In1;
    f2: In2;
    f3: In3;

    init() {
        self.f1 = In1{a:1};
        self.f2 = In2{a:2};
        self.f3 = In3{a:3};
    }
}