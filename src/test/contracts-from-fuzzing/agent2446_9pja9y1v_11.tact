struct A { f: Int; }
struct B { f: A; }
struct C { f: B; }

contract NestedOptContract {
    val: C?;

    init() {
        self.val = null;
    }
}