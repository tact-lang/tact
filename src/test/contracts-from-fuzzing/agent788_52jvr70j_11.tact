struct Small1 { a: Int; }
struct Small2 { b: Bool; }
struct Small3 { c: String; }
struct Small4 { d: Int?; }

struct Combined {
    s1: Small1;
    s2: Small2;
    s3: Small3;
    s4: Small4;
}

contract NestedMany {
    val: Combined;

    init() {
        self.val = Combined{
            s1: Small1{a: 7},
            s2: Small2{b: false},
            s3: Small3{c: "ccc"},
            s4: Small4{d: null}
        };
    }
}