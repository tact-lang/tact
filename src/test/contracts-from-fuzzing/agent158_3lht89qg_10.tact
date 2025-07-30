struct Rec1 { next: Rec2?; val: Int; }
struct Rec2 { next: Rec3?; val: Int; }
struct Rec3 { val: Int; }

contract NestedOptionalsChain {
    s: Rec1;
    init() {
        self.s = Rec1{
            val:1,
            next: Rec2{
                val:2,
                next: Rec3{ val:3 }
            }
        };
    }
}