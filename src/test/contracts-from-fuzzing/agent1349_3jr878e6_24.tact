struct NestedStrings {
    a: String;
    b: String;
}

struct ContainerStringOpt {
    x: NestedStrings;
    y: String?;
}

contract MixedStrings {
    field: ContainerStringOpt = ContainerStringOpt{
        x: NestedStrings{ a:"aaa", b:"bbb" },
        y: null
    };

    receive() {
        self.field = self.field;
    }
}