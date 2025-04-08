struct Rec1 { a: Int }
struct Rec2 { b: Int }
struct Rec3 { c: Rec2 }

contract Deeply {
    rec: Rec3;

    init() {
        self.rec = Rec3{ c: Rec2{ b:1 } };
    }
}