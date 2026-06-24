struct Rec1 { x:Int; next: Int?; }
struct Rec2 { a: Rec1; b: Int; }
struct Rec3 { c: Rec2; d: Bool; }

contract ChainRec {
    data: Rec3;

    init() {
        self.data = Rec3{
            c: Rec2{
                a: Rec1{ x: 1, next: null },
                b: 2,
            },
            d: true,
        };
    }
}