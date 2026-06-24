struct A { x: Int }
struct B { a: A }
struct C { b: B }

contract OmitDefaults {
    data: C;
    init() {
        self.data = C { b: B { a: A { x: 5 } } };
    }
}