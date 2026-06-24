struct NestedStrings {
    x: String;
    y: String?;
    z: String;
}

struct Outer {
    n: NestedStrings;
    s: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            n: NestedStrings{ x: "a", y: null, z: "b" },
            s: "outer"
        };
    }
}
