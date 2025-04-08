struct A { v: Int; }
struct B { a: A?; }
struct C { b: B?; }
struct D { c: C?; }

contract DeepNest {
    d: D?;
    receive() {}
}