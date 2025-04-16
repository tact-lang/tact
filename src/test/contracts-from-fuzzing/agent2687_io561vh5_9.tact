struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Outer {
    p1: Inner1;
    p2: Inner2;
}

contract MultiStructStorage {
    val: Outer;

    init() {
        self.val = Outer{ p1: Inner1{ x: 5 }, p2: Inner2{ y: 10 } };
    }
}