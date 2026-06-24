struct InnerX {
    a: Int; 
}

struct OuterX {
    x: Int;
    inner: InnerX;
    y: Int?;
}

contract MixedNested {
    data: OuterX;

    init() {
        self.data = OuterX{
            x: 5,
            inner: InnerX{a: 10},
            y: null
        };
    }
}