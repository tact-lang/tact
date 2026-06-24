struct Deep {
    d1: Int;
    d2: Bool;
    d3: Int?;
}

struct Middle {
    m1: Int;
    m2: Deep;
    m3: Bool;
}

struct Outer {
    o1: Middle;
    o2: Int;
}

contract DeepNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            o1: Middle{
                m1: 1,
                m2: Deep{ d1: 2, d2: false, d3: null },
                m3: true
            },
            o2: 3
        };
    }

    receive() {
        self.data.o2 += 1;
    }
}