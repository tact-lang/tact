struct A { i: Int; }
struct B { j: Int; a: A; }

contract OptNested {
    nested: B?;

    init() {
        self.nested = null;
    }
}