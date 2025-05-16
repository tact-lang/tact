struct A { v: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }
struct F { e: E }
contract VeryDeep {
    dep: F;
    init() {
        self.dep = F{e:E{d:D{c:C{b:B{a:A{v:77}}}}}};
    }
}
