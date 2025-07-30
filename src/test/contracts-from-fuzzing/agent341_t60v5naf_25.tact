struct A { x: Int }

struct B { y: A }

contract NestedWithOptionalDefault {
    val: B = B{ y: A{ x: 123 } };
}