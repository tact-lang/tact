struct A { x: Int; y: Int; }
struct B { a1: A; a2: A; a3: A; }

contract ManyNestedSame {
    data: B;

    init() {
        self.data = B{
            a1: A{ x: 1, y: 2 },
            a2: A{ x: 3, y: 4 },
            a3: A{ x: 5, y: 6 }
        };
    }
}