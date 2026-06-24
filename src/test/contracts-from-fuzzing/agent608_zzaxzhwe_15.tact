struct A { a: Int; }
struct B { b: Int; }
struct C { a: A; b:B; }
contract Test {
    c1:C=C{a:A{a:1}, b:B{b:2}};
    c2:C=C{a:A{a:3}, b:B{b:4}};
}
