struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    innerOpt: Inner?;
    s: String?;
    val: Int;
}

contract TestContract {
    nestedOpt: Outer?;

    init() {
        self.nestedOpt = Outer{
            innerOpt: Inner{ x: null, y: true },
            s: null,
            val: 9
        };
    }
}