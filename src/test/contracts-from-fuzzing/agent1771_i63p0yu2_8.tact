struct Inner {
    innerVal: Int;
}

struct Outer {
    a: Int?;
    b: Bool?;
    innerOpt: Inner?;
}

contract MixedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            a: null,
            b: null,
            innerOpt: null,
        };
    }
}