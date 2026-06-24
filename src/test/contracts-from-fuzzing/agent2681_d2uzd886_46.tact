struct D { val: Int; }

struct C { d: D?; }

struct B { c: C?; }

struct A { b: B?; }

contract DeepOptionalChain {
    a: A? = null;
}