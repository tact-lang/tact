struct Rec1 { val: Int; next: Rec2; }
struct Rec2 { val: Int; next: Rec3; }
struct Rec3 { val: Int; }

contract Chain {
    value: Rec1;

    init() {
        self.value = Rec1{
            val: 1,
            next: Rec2{
                val:2,
                next: Rec3{val:3}
            }
        };
    }
}