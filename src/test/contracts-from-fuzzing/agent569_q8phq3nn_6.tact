struct A { x: Int; y: Bool; }
struct B { a: A; z: String; }
struct C { b1: B; b2: B; flag: Bool; }

contract TestContract {
    c: C;

    init() {
        self.c = C{
            b1: B{a: A{x: 1, y: true}, z: "hi"},
            b2: B{a: A{x: 2, y: false}, z: "bye"},
            flag: true
        };
    }
}