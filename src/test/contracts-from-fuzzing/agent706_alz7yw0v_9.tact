struct OptionalNested {
    optInner: Inner?;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            optInner: null,
            flag: true,
        };
    }
}