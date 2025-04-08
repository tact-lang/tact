struct A { x: Int; }
struct B { a: A? = null; }
struct C { b: B? = null; }
struct D { c: C? = null; }

contract DeepNulls {
    val: D = D{ c: null };
}