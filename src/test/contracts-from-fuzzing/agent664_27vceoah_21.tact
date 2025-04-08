struct Rec1 {
    a: Int;
}
struct Rec2 {
    b: Rec1;
}
struct Rec3 {
    c: Rec2;
}
struct Rec4 {
    d: Rec3;
}
struct Rec5 {
    e: Rec4;
}
struct Rec6 {
    f: Rec5;
}
contract SixDeep {
    field: Rec6;

    init() {
        self.field = Rec6{ f: Rec5{ e: Rec4{ d: Rec3{ c: Rec2{ b: Rec1{ a:1 } } } } } };
    }
}
