// break recursion more aggressively: only one optional pointing to a struct that points nowhere
struct A {
    b: B?;
}

struct B {
    x: Int;
}

contract NoCycle {
    foo: A;
    init() { self.foo = A{ b: null }; }
}