struct S1 { x: Int; }
struct S2 { s1: S1; }

contract DefaultNestedInit {
    val: S2;

    init() {
        self.val = S2{
            s1: S1{x:5}
        };
    }
}