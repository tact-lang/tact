struct A { x: Int; }
struct B { x: Int; }
struct C { a: A; b: B; }

contract SameFieldNamesNested {
    data: C;

    init() {
        self.data = C{
            a: A{ x: 10 },
            b: B{ x: 20 },
        };
    }
}