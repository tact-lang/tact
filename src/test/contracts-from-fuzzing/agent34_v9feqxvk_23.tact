struct InnerA { x: Int }
struct InnerB { y: Int }
struct Combined {
    a: InnerA;
    b: InnerB;
}

contract MultipleNested {
    s: Combined;

    init() {
        self.s = Combined{
            a: InnerA{ x: 42 },
            b: InnerB{ y: 17 }
        };
    }
}