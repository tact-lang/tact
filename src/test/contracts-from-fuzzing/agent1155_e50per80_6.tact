struct InnerMost {
    val: Int;
}

struct Inner {
    innermost: InnerMost;
    another: Bool;
}

struct Outer {
    inner: Inner;
    str: String;
    optCell: Cell?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                innermost: InnerMost{
                    val: 123456
                },
                another: true
            },
            str: "Test",
            optCell: emptyCell()
        };
    }
}
