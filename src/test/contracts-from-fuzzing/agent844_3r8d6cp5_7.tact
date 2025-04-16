struct A { f: Int; }
struct B { g: Int; }
struct C { h: Int; }

struct D {
    a: A;
    b: B;
    c: C;
}

contract NestedMany {
    k: D = D{a:A{f:1}, b:B{g:2}, c:C{h:3}};
}