struct Rec1 { a: Int }
struct Rec2 { b: Int }
struct Rec3 { c: Int }
struct Rec4 { d: Int }
struct Rec5 { e: Int }

contract WideNestedFields {
    f1: Rec1;
    f2: Rec2;
    f3: Rec3;
    f4: Rec4;
    f5: Rec5;

    init() {
        self.f1 = Rec1{a: 1};
        self.f2 = Rec2{b: 2};
        self.f3 = Rec3{c: 3};
        self.f4 = Rec4{d: 4};
        self.f5 = Rec5{e: 5};
    }
}