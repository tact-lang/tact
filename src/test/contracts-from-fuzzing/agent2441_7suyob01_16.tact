struct A { x: Int }
struct B { y: A }
struct C { z: B }

contract OptionalDeeper {
    deep: C?;

    init() {
        self.deep = null;
    }
}