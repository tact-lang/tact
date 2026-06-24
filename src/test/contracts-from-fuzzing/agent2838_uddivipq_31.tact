struct Mid1 { x: Int; }
struct Mid2 { y: Int; }
struct Outermost { a: Mid1; b: Mid2; c: Int; }
contract ManyNestLayers {
    s: Outermost;

    init() {
        self.s = Outermost {
            a: Mid1 { x: 42 },
            b: Mid2 { y: 13 },
            c: 99
        };
    }
}