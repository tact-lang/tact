struct A { a: Int }
struct B { b: A }
struct C { c: B }
struct D { d: C }

contract DeepOpt {
    record: D?;

    init() {
        self.record = D{ d: C{ c: B{ b: A{ a: 111 }}}};
    }
}