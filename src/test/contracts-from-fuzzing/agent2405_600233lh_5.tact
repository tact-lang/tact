struct A { f1: Int; }
struct B { f2: Int; nested: A; }
struct C { f3: Int; nested: B; }

contract NestedOptional {
    data: C?;

    init() {
        self.data = null;
    }
}