struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct ManyStructs {
    sa: A;
    sb: B;
    sc: C;
}

contract TestManyStructs {
    val: ManyStructs;
    init() {
        self.val = ManyStructs{
            sa: A{a:1},
            sb: B{b:2},
            sc: C{c:3}
        };
    }
}