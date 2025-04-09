struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    innerOpt: Inner?;
    flag: Bool;
}

struct Outer {
    middle: Middle;
}

contract ComplexOptional {
    data: Outer;
    init() {
        self.data = Outer {
            middle: Middle {
                innerOpt: null,
                flag: true
            }
        };
    }
}
