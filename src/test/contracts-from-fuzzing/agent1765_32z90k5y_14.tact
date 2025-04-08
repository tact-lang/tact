struct A { x: Int; }
struct B { y: A; }

contract NestedDefault {
    b: B = B{ y: A{ x: 5 } };
}