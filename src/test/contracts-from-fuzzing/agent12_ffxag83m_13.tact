struct Outer {
    inn: Inner;
}

struct Inner {
    de: Deep;
}

struct Deep {
    x: Int;
    y: Int;
    s: String?;
}

contract OutInOut {
    outer: Outer;

    init() {
        self.outer = Outer{
            inn: Inner{
                de: Deep{
                    x: 1, 
                    y: 2,
                    s: null
                }
            }
        };
    }
}
