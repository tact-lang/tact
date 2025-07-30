struct Inner { xi: Int }
struct Outer { i1: Inner; i2: Inner; i3: Inner; }

contract ManyNestedSame {
    outer: Outer;

    init() {
        self.outer = Outer{
            i1: Inner{ xi: 1 },
            i2: Inner{ xi: 2 },
            i3: Inner{ xi: 3 }
        };
    }
}
