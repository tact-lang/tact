struct NestedBooleans {
    x: Bool;
    y: Bool;
}

struct OuterStruct {
    a: Int;
    inner: NestedBooleans;
    s: String;
}

contract NestedBoolContract {
    v: OuterStruct;

    init() {
        self.v = OuterStruct{
            a: 100,
            inner: NestedBooleans{ x: true, y: false },
            s: "test"
        };
    }
}
