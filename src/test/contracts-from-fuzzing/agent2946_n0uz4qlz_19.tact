struct NestOptBool {
    val: Bool?;
}

struct ContainerOptBool {
    nested: NestOptBool?;
}

contract OptOptBool {
    field: ContainerOptBool;
    init() {
        self.field = ContainerOptBool{ nested: null };
    }
}