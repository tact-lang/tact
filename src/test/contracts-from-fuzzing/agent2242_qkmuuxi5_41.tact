struct Rec1 { a: Int; }
struct Rec2 { b: Rec1; }
struct Rec3 { c: Rec2; }
struct Rec4 { d: Rec3; }
struct Rec5 { e: Rec4; }
struct Rec6 { f: Rec5; }
struct Rec7 { g: Rec6; }
struct Rec8 { h: Rec7; }

contract EightNest {
    val: Rec8;

    init() {
        self.val = Rec8{ h: Rec7{ g: Rec6{ f: Rec5{ e: Rec4{ d: Rec3{ c: Rec2{ b: Rec1{ a: 777 } } } } } } } };
    }
}