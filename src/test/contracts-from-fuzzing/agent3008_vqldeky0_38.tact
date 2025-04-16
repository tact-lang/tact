struct A { a: Int?; }
struct B { b: A?; }
struct C { c: B?; }

contract NestedNulls {
    x: C;

    init() {
        self.x = C{
            c: null,
        };
    }
}