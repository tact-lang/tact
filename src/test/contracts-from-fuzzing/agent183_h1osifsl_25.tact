struct A { val: Int }
struct B { val: A }
struct C { val: B }
struct D { val: C }
struct E { val: D }
struct F { val: E }

contract VeryDeep {
    deep: F;
    init() {
        self.deep = F{val: E{val: D{val: C{val: B{val: A{val: 42}}}}}};
    }
}