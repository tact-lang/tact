struct Mid {
    n: Int;
    o: Bool;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract NestedMany {
    val: Top;

    init() {
        let mid = Mid{n:1,o:true};
        self.val = Top{m1:mid,m2:mid};
    }
}
