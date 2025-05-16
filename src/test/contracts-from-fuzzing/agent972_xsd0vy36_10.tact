struct NestedStringsOpt {
    msg: String?;
}

struct ContainerWithNested {
    nested: NestedStringsOpt?;
    label: String;
}

contract TestNestedOptStrings {
    storage: ContainerWithNested;

    init() {
        self.storage = ContainerWithNested{
            nested: NestedStringsOpt{ msg: null },
            label: "foo"
        };
    }
}
