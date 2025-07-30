struct Rec1 { next: Rec2?; v: Int; }
struct Rec2 { next: Rec3?; v: Int; }
struct Rec3 { v: Int; }

contract ChainOptionalNested {
    head: Rec1?;
    init() { self.head = null; }
}