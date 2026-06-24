struct Rec1 { a: Int; }
struct Rec2 { b: Rec1; }
struct Rec3 { c: Rec2; }

contract DeepInit {
    data: Rec3;

    init() {
        self.data = Rec3 {
            c: Rec2 {
                b: Rec1{ a: 7 }
            }
        };
    }
}