struct NestedStructsWithStrings {
    x: Inner;
}

struct Inner {
    s: String;
}

contract TestContract {
    f: NestedStructsWithStrings;
    init() {
        self.f = NestedStructsWithStrings{
            x: Inner{ s: "data" }
        };
    }
}
