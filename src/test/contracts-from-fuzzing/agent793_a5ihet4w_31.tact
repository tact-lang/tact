struct A { v: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }
struct F { e: E; }

contract TestContract {
    data: F;

    init() {
        self.data = F{e:E{d:D{c:C{b:B{a:A{v:42}}}}}};
    }

    receive() {}
}