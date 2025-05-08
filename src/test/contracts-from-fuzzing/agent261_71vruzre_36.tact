struct MyNest1 { a: Int }
struct MyNest2 { b: Bool }
struct MyNest3 {
    n1: MyNest1;
    n2: MyNest2;
}

contract MultiNested {
    composed: MyNest3;

    init() {
        self.composed = MyNest3 {
            n1: MyNest1 { a: 22 },
            n2: MyNest2 { b: false }
        };
    }

    receive() {
        let _ = self.composed.n1.a + (self.composed.n2.b ? 1 : 0);
    }
}