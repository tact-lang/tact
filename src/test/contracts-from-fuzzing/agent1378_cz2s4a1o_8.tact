struct Rec1 {
    foo: Int;
}
struct Rec2 {
    bar: Rec1;
}
struct Rec3 {
    baz: Rec2;
}
contract Arranged {
    rec: Rec3 = Rec3{baz:Rec2{bar:Rec1{foo:123}}};
    init() {
        self.rec = Rec3{baz:Rec2{bar:Rec1{foo:321}}};
    }
    receive() {}
}