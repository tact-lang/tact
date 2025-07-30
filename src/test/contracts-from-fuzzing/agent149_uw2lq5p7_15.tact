struct NestedDefault {
    x: Int = 1;
    y: Bool = false;
}

struct ContainNested {
    n: NestedDefault;
    s: String;
}

contract NestedDefaults {
    state: ContainNested;

    init() {
        self.state = ContainNested{
            n: NestedDefault{},
            s: "hi"
        };
    }
}