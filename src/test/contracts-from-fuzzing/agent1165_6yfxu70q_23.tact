struct NestedOptionStruct {
    val: Int?;
    msg: String?;
}

struct Container {
    nested: NestedOptionStruct;
}

contract OptionalInContainers {
    cont: Container;

    init() {
        self.cont = Container{ nested: NestedOptionStruct{ val: null, msg: null } };
    }
}
