struct A { a: Int }
struct B { b: Int; a1: A; a2: A; }
contract MultiStructSameTypeNested {
    val: B;

    init() {
        self.val = B{
            b:0,
            a1:A{a:1},
            a2:A{a:2}
        };
    }
}