struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct D { d: Int }
struct E { e: Int }
struct F { f: Int }

struct NestedSix {
    sa: A;
    sb: B;
    sc: C;
    sd: D;
    se: E;
    sf: F;
}

contract AggSix {
    val: NestedSix;

    init() {
        self.val = NestedSix{
            sa: A{a:1}, sb: B{b:2}, sc: C{c:3}, sd: D{d:4}, se: E{e:5}, sf: F{f:6}
        };
    }
}