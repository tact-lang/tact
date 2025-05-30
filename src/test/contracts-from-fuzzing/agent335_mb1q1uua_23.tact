struct Rec1 { next: Rec2?; val: Int; }
struct Rec2 { next: Rec3?; val: Int; }
struct Rec3 { val: Int; }

contract PseudoRecursiveContract {
    data: Rec1;

    init() {
        self.data = Rec1 {
            val:1,
            next: Rec2 {
                val:2,
                next: Rec3 { val:3 }
            }
        };
    }
}