struct InnerMost {
    a: Int;
}

struct Mid {
    b: InnerMost;
}

struct Outer {
    c: Mid?;
}

contract Test28 {
    val: Outer;
    init() {
        self.val = Outer{c:null};
    }
}