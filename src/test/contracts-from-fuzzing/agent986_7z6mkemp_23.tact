struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

struct Container {
    a1: A;
    b1: B;
    c1: C;
    a2: A;
    b2: B;
    c2: C;
}

contract ReplicatedNested {
    val: Container;

    init() {
        self.val = Container{
            a1: A{a:1},
            b1: B{b:true},
            c1: C{c:"x"},
            a2: A{a:2},
            b2: B{b:false},
            c2: C{c:"y"}
        };
    }
}