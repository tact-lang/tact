struct C { c: Int = 3; }
struct B { b: Int = 2; innerC: C = C{ c: 33 }; }
struct A { a: Int = 1; innerB: B = B{ b: 22, innerC: C{ c: 333 } }; }

contract DeepNestedDefault {
    s: A = A{ a: 11, innerB: B{ b: 222, innerC: C{ c: 3333 } } };
}