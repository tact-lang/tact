struct BigNest {
    a: Int;
    b: Second;
    c: Third;
}

struct Second {
    x: Int;
    y: Third;
}

struct Third {
    n: Int;
    flag: Bool;
}

contract CyclicTest {
    state: BigNest;

    init() {
        self.state = BigNest{
            a: 1,
            b: Second{
                x: 2,
                y: Third{
                    n: 3,
                    flag: false
                }
            },
            c: Third{
                n: 4,
                flag: true
            }
        };
    }
}
