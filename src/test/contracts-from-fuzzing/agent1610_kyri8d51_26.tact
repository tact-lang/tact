struct Inner {
    i1: Int;
    i2: Bool;
}
struct Outer {
    o1: Inner;
    o2: Int;
    o3: Int;
}
contract ManyNestedFields {
    data: Outer;
    init() {
        self.data = Outer{
            o1: Inner{ i1: 7, i2: true },
            o2: 8,
            o3: 9
        };
    }
}