struct Middle {
    sub1: Int;
    sub2: String;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract ManyNested {
    o: Outer;

    init() {
        self.o = Outer{
            m1: Middle{sub1:1, sub2:"a"},
            m2: Middle{sub1:2, sub2:"b"},
            m3: Middle{sub1:3, sub2:"c"}
        };
    }
}