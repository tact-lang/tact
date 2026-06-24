struct InnerA { a: Int; }
struct InnerB { b: Int; }
struct InnerC { c: Int; }

struct Combined {
    x: InnerA;
    y: InnerB;
    z: InnerC;
}

contract CombineEmbed {
    data: Combined;

    init() {
        self.data = Combined{
            x: InnerA{ a: 1 }, y: InnerB{ b: 2 }, z: InnerC{ c:3 }
        };
    }
}