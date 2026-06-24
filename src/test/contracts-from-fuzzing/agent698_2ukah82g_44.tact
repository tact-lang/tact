struct A { i: Int; }
struct B { j: Int; }

struct Both {
    a: A;
    b: B;
}

contract TestContract {
    val: Both;

    init() {
        self.val = Both{
            a: A{ i:1 },
            b: B{ j:2 }
        };
    }
}