struct OptionalInner {
    value: Int?;
}

struct Outer {
    a: OptionalInner?;
    b: OptionalInner?;
    c: OptionalInner?;
}

contract ManyOptionNested {
    data: Outer;

    init() {
        self.data = Outer{
            a:null, b:null, c:null
        };
    }
}
