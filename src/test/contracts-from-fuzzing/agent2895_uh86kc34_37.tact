struct A { x: Int }
struct B { y: Int }
struct C { z: Int }

struct D {
    a: A;
    b: B;
    c: C;
}

contract ThreeStructsNested {
    val: D;

    init() {
        self.val = D{ a: A{x:1}, b: B{y:2}, c: C{z:3} };
    }
}
