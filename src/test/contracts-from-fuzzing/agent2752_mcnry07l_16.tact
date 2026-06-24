struct A { a: Int = 1; }
struct B { b: Int = 2; }
struct C { c: Int = 3; }

struct NestMany {
    sa: A = A{};
    sb: B = B{};
    sc: C = C{};
}

contract ManyStructsNested {
    nest: NestMany = NestMany{};
}