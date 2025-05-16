struct Inner1 { a: Int; }
struct Inner2 { a: Int; }
struct OuterAlt {
    one: Inner1;
    two: Inner2;
}
contract StructsDiff {
    val: OuterAlt;

    init() {
        self.val = OuterAlt{
            one: Inner1{a:10},
            two: Inner2{a:20}
        };
    }
}
