struct Outer {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
    optBool: Bool?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: null
        };
    }
}
