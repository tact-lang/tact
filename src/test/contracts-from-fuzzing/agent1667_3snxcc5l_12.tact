struct Rec1 { a: Int; }
struct Rec2 { b: Rec1; }
struct Rec3 { c: Rec2; }
struct Rec4 { d: Rec3; }
struct Rec5 { e: Rec4; }

contract TestContract {
    data: Rec5;

    init() {
        self.data = Rec5{e:Rec4{d:Rec3{c:Rec2{b:Rec1{a:42}}}}};
    }
}