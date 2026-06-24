struct Sub {
    x: Int;
}

struct OuterComposed {
    a: Sub;
    b: Sub;
    c: Sub;
    d: Sub;
    e: Sub;
}

contract ManyNestedSubs {
    container: OuterComposed;

    init() {
        self.container = OuterComposed {
            a: Sub { x: 1 },
            b: Sub { x: 2 },
            c: Sub { x: 3 },
            d: Sub { x: 4 },
            e: Sub { x: 5 }
        };
    }

    receive() {
        let _ = self.container.c.x;
    }
}