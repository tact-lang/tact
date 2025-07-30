struct InnerMost {
    a: Int;
}
struct Middle {
    b: InnerMost;
}
struct OuterMost {
    c: Middle;
}

contract ThreeNest {
    val: OuterMost;
    init() {
        self.val = OuterMost{ c: Middle{ b: InnerMost{ a: 1 } } };
    }
}