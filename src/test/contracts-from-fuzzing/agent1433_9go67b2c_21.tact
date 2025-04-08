struct Deep {
    a: Int;
    b: String;
}

struct Mid {
    x: Deep;
    y: Deep?;
}

struct Top {
    m: Mid;
    n: Mid?;
}

contract NestedStructOptionals {
    data: Top;

    init() {
        self.data = Top{
            m: Mid{ x: Deep{a:1,b:"x"}, y:null },
            n: null
        };
    }
}
