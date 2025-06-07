struct A { val: Int }
struct B { a: A }
struct C { b: B }

contract ParamDeepNest(
    c: C
) {}