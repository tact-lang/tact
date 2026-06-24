struct Inner { num: Int; }

struct OuterWithOptional {
    optionInner: Inner?;
    flag: Bool;
}

contract TestContract {
    composite: OuterWithOptional;

    init() {
        self.composite = OuterWithOptional{
            optionInner: null,
            flag: true,
        };
    }
}