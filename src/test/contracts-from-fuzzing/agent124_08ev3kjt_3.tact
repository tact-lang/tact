struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }

contract DeepNestedTest {
    deep: C;

    init() {
        self.deep = C{ c: B{ b: A{ a: 1 } } };
    }
}