struct Deep {
    a: Int;
    b: Bool?;
    c: String;
}

struct Middle {
    m: Deep;
    n: String;
}

struct Outer {
    s1: Middle;
    s2: Middle;
}

contract TestContract {
    complex: Outer;
    
    init() {
        self.complex = Outer{
            s1: Middle{
                m: Deep{ a: 1, b: true, c: "x" },
                n: "mid1",
            },
            s2: Middle{
                m: Deep{ a: 2, b: false, c: "y" },
                n: "mid2",
            },
        };
    }
}