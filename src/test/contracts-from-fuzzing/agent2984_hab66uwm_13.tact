struct InnerMost { x: Int }
struct Inner2 { im: InnerMost }
struct Inner1 { i2: Inner2 }

struct Wrap {
    raw: Int;
    i1: Inner1;
}

contract Test14 {
    wrap: Wrap;
    init() {
        self.wrap = Wrap{
            raw:7,
            i1: Inner1{ i2: Inner2{ im: InnerMost{ x:9 } } }
        };
    }
}
