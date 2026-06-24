struct C { leaf: Int = 7; }

struct B { node: C = C{}; }

struct A { root: B = B{}; }

contract DeepNested {
    val: A = A{};
}