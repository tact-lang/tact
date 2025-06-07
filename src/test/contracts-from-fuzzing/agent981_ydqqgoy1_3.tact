struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Inner;
}

struct Inner {
    x: Bool;
    y: String;
    z: SubInner;
}

struct SubInner {
    q: Int;
    w: Bool?;
}

contract DeepNested {
    data: Deep;
    init() {
        self.data = Deep{
            a: 1,
            b: true,
            c: "X",
            d: Inner{
                x: false,
                y: "Y",
                z: SubInner{
                    q: 100,
                    w: null,
                }
            }
        };
    }
}