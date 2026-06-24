struct DefaultsNested {
    val: Int = 0;
    flag: Bool = false;
}

struct Wrapping {
    a: DefaultsNested;
    b: DefaultsNested;
}

contract DefaultNestedWrap {
    w: Wrapping;

    init() {
        self.w = Wrapping{
            a: DefaultsNested{},
            b: DefaultsNested{}
        };
    }
}