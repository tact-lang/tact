struct Rec1 { a: Int; }
struct Rec2 { b: Int; nested: Rec1; }

contract NestedWithDefaults {
    big: Rec2;
    init() {
        self.big = Rec2{ b: 5, nested: Rec1{ a:10 } };
    }
}