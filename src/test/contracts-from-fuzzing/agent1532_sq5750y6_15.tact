struct InnerMost { v: Int; }
struct Mid { a: InnerMost; b: InnerMost; }
struct OuterMost { m1: Mid; m2: Mid; flag: Bool; }

contract ComplexManyNest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m1: Mid{ a: InnerMost{v:1}, b: InnerMost{v:2} },
            m2: Mid{ a: InnerMost{v:3}, b: InnerMost{v:4} },
            flag: true,
        };
    }
}