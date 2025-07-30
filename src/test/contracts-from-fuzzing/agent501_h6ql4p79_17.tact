struct InnerMost {
    a: Int;
    b: String;
}
struct Inner {
    x: Bool;
    y: InnerMost;
}
struct Outer {
    z: Cell;
    innerVal: Inner;
}

contract MultiLayered {
    data: Outer;

    init() {
        self.data = Outer{
            z: emptyCell(),
            innerVal: Inner{
                x: true,
                y: InnerMost{ a:123, b:"hi" }
            }
        };
    }
}