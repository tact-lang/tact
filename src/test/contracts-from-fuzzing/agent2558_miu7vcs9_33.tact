struct Deep {
    v1: Int; v2: String; v3: Bool;
}

struct Mid {
    d1: Deep; d2: Deep;
}

struct Outer {
    m1: Mid; m2: Mid;
}

contract ManyNested {
    x: Outer;

    init() {
        self.x = Outer{
            m1: Mid{
                d1: Deep{ v1:1, v2:"a", v3:true },
                d2: Deep{ v1:2, v2:"b", v3:false },
            },
            m2: Mid{
                d1: Deep{ v1:3, v2:"c", v3:true },
                d2: Deep{ v1:4, v2:"d", v3:false },
            },
        };
    }
}