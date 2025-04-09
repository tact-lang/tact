struct D { val: Int = 4; }
struct C { d: D; }
struct B { c: C; }
struct A { b: B; }

contract TestContract {
    deep: A = A{b: B{c: C{d: D{val: 4}}}};
}