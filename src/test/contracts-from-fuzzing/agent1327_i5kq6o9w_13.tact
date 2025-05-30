struct A { x: Int; y: Int; }
struct B { p: Int; q: Int; }
struct C { foo: A; bar: B; }

contract StructInStruct {
    storage: C;

    init() {
        self.storage = C {
            foo: A {x:1,y:2},
            bar: B {p:3,q:4}
        };
    }
}