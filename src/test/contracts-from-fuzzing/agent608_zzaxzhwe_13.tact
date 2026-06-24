struct A { x: Int; }
struct B { y: Int; a: A; }
struct C { b: B; z: Int; }

contract Test {
    value: C = C{b: B{y:2, a:A{x:1}}, z:3};
}
