struct Outer {
    x: Int;
    inner: Inner;
}

struct Inner {
    y: Int;
    deeper: Deeper;
}

struct Deeper {
    z: Int;
}

contract RecursiveFields {
    data: Outer;

    init() {
        self.data = Outer{
            x:1,
            inner: Inner{
                y:2,
                deeper: Deeper{ z:3 }
            }
        };
    }
}
