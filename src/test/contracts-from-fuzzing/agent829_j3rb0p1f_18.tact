struct DefaultNested {
    a: Int = 5;
    b: Bool = false;
}

struct Holder {
    val: DefaultNested;
}

contract NestedDefaults {
    h: Holder;

    init() {
        self.h = Holder{
            val: DefaultNested{},
        };
    }
}