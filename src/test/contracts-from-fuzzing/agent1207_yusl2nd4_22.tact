struct Mid {
    label: String;
}

struct Outer {
    middle: Mid;
}

contract NestedStringContainer {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Mid{ label: "test" }
        };
    }
}