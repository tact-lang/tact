struct Child { foo: Int }

struct Parent { a: Int; b: Child; c: Child; d: Int }

contract SiblingsNestedTest {
    s: Parent;
    init() {
        self.s = Parent{
            a: 1,
            b: Child{foo: 10},
            c: Child{foo: 20},
            d: 2
        };
    }
}