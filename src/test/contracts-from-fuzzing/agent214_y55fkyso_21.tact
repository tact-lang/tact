struct In1 { x: Int }
struct In2 { a: Int; b: In1 }
struct In3 { c: In2; d: Int }
contract OptMiddle {
    val: In3?;

    init() {
        self.val = In3{
            c: In2{ a:1, b:In1{x:2} },
            d:3
        };
    }
}
