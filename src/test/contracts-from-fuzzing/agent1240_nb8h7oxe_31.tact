struct NestedOptionStruct {
    val: Int?;
}

struct ContainerOpt {
    nested: NestedOptionStruct?;
}

contract OptStructFieldOpt {
    payload: ContainerOpt;
    init() {
        self.payload = ContainerOpt{
            nested: null
        };
    }
}