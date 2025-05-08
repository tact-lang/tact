struct Rec1 {
    next: Rec2;
}
struct Rec2 {
    next: Rec3;
}
struct Rec3 {
    next: Rec4;
}
struct Rec4 {
    flag: Bool;
    val: Int;
}

contract RecursiveChain {
    f: Rec1;

    init() {
        self.f = Rec1{next: Rec2{next: Rec3{next: Rec4{flag:true, val: 5}}}};
    }
}