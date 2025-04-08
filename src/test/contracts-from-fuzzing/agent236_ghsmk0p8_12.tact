struct Inner {
    smallUInt: Int as uint4;
    tinyInt: Int as int1;
}

struct Outer {
    maybeInner: Inner?;
    label: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            maybeInner: null,
            label: "opt+serialization",
        };
    }
}