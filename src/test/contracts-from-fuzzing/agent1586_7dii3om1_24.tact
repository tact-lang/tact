struct D { val: String?; }
struct C { d: D?; }
struct B { c: C?; }
struct A { b: B?; }

contract TestContract {
    a: A? = null;

    receive() {}
}