struct Inner {
    x: Int;
    y: String;
    z: Bool?;
}

struct Mid {
    a: Inner;
    b: Inner?;
    c: String;
    d: Bool
}

struct Outer {
    m1: Mid;
    m2: Mid?;
    t: Int;
    s: String?;
}

contract MixedNested {
    data: Outer;
    
    init() {
        self.data = Outer{
            m1: Mid{
                a: Inner{ x:1, y:"", z:null },
                b: null,
                c: "test",
                d: true
            },
            m2: null,
            t: 0,
            s: null
        };
    }
}