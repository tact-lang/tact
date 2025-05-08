struct Rec1 {
    next: Rec2?;
    val: Int;
}

struct Rec2 {
    next: Rec3?;
    val: Int;
}

struct Rec3 {
    val: Int;
}

contract Test {
    chain: Rec1;

    init() {
        self.chain = Rec1{
            val:1,
            next: Rec2{
                val:2,
                next: Rec3{val:3}
            }
        };
    }
}