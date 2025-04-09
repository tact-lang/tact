struct A { b: Int; }
struct B { a: A; }
struct C { b: B; }
contract Nest3 {
    store: C;
    init() {
        self.store = C{b: B{a: A{b: 42}}};
    }
}