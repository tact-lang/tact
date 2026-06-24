struct DeepOpt {
    intVal: Int?;
    boolVal: Bool?;
}

struct NestedOpt {
    inner: DeepOpt?;
}

contract Test5 {
    state: NestedOpt;
    init() {
        self.state = NestedOpt{
            inner: DeepOpt{
                intVal: 42,
                boolVal: null
            }
        };
    }
}
