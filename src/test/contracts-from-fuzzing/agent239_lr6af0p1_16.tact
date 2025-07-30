struct NestedOptionalFields {
    x: Int?;
    y: Bool?;
}

struct ContainerOptOpt {
    field: NestedOptionalFields?;
}

contract NestedOptionalWrap {
    someField: ContainerOptOpt;

    init() {
        self.someField = ContainerOptOpt{ field: null };
    }
}