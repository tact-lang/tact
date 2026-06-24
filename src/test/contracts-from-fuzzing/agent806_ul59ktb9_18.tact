struct A { x: Int }
struct B { y: Int }

struct OuterX {
    a: A?;
    b: B;
}

contract OptionalStructural {
    d: OuterX;

    init() {
        self.d = OuterX{
            a: null,
            b: B{y: 7}
        };
    }
}