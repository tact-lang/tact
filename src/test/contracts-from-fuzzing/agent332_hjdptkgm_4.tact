struct InnerMost { value: Int; }

struct Middle { nested: InnerMost; }

struct Outer {
    nested: Middle;
    extra: Bool;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Middle{
                nested: InnerMost{
                    value: 42
                }
            },
            extra: true
        };
    }
}