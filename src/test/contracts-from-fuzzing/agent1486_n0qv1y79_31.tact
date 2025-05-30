struct D {
    a: Int?;
    b: Bool?;
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

contract PartialNulls {
    x: B?;

    init() {
        self.x = B{
            c: C{
                d: null
            }
        };
    }
}