struct A { val: Int }

struct B { x: Bool; y: A? }

struct C { z: B }

contract NestedOptionals {
    field: C;

    init() {
        self.field = C{
            z: B{ x: true, y: null }
        };
    }
}