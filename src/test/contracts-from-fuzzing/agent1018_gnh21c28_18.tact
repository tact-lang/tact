struct Bottom {
    x: Int;
    y: String?;
}

struct Middle2 {
    a: Bottom;
    b: Bottom;
}

struct Topper {
    m1: Middle2;
    m2: Middle2;
}

contract WideNest {
    data: Topper;

    init() {
        self.data = Topper{
            m1: Middle2{
                a: Bottom{ x: 1, y: null },
                b: Bottom{ x: 2, y: "hi" }
            },
            m2: Middle2{
                a: Bottom{ x: 3, y: "yo" },
                b: Bottom{ x: 4, y: null }
            }
        };
    }
}