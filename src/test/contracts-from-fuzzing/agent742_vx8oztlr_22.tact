struct C { val: Int; }
struct B { c: C; }
struct A { b: B; }
struct Root { a: A; }

contract TestContract {
    root: Root = Root{ a: A{ b: B{ c: C{ val: 777 } } } };
    init() {}
}