struct Deep {
    d1: Int;
    d2: String;
}

struct Middle {
    m1: Deep;
    m2: Int;
}

struct Outer {
    o1: Middle;
    o2: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            o1: Middle{
                m1: Deep{
                    d1: 10,
                    d2: "abc"
                },
                m2: 20
            },
            o2: false
        };
    }
}