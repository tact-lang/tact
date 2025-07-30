struct A { f1: Int; f2: Int }
struct B { nested: A }
struct C { nestedB: B }

contract DeepTest {
    c: C;

    init() {
        self.c = C{ nestedB: B{ nested: A{ f1: 5, f2: 10 } } };
    }
}