struct Bottom { b: Int; }
struct Middle1 { m1: Bottom; }
struct Middle2 { m2: Bottom; }
struct Middle3 { m3: Bottom; }

struct Top {
    t1: Middle1;
    t2: Middle2;
    t3: Middle3;
}

contract WideNested {
    data: Top;

    init() {
        self.data = Top{
            t1: Middle1{ m1: Bottom{ b: 1 } },
            t2: Middle2{ m2: Bottom{ b: 2 } },
            t3: Middle3{ m3: Bottom{ b: 3 } },
        };
    }
}