struct A { si: Int; sb: Bool; }
struct B { a: A; }
struct C { b: B; }

contract NestedNested {
    val: C;

    init() {
        self.val = C{b:B{a:A{si:7,sb:false}}};
    }
}