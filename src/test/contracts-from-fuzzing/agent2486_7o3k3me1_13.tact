struct A { x: Int }
struct B { x: A }
struct C { x: B }
struct D { x: C }
struct E { x: D }

contract DeepChain {
    data: E = E{ x: D{ x: C{ x: B{ x: A{ x: 42 } } } } };
}