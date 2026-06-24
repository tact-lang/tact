struct NestedStrings {
    s1: String;
    s2: String?;
}

struct Container {
    nest: NestedStrings;
    label: String;
}

contract TestContract {
    complexStrs: Container;

    init() {
        self.complexStrs = Container{
            nest: NestedStrings{ s1: "hi", s2: null },
            label: "ok"
        };
    }
}