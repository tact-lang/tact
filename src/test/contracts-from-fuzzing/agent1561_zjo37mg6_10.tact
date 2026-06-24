struct A { x: Int }
struct B { a: A; y: Int }
struct C { b: B; z: Int }
struct D { c: C; }

contract TestOptDeep {
    st: D?;

    init() {
        self.st = null;
    }
}
