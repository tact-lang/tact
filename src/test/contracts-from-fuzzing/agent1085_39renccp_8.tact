struct DeepOpt {
    innerOpt: Int?;
    deeperOpt: String?;
    anotherOpt: Bool?;
}

struct ContainerOpt {
    dep: DeepOpt?;
    intVal: Int;
    boolVal: Bool;
}

contract TestContract {
    payload: ContainerOpt;

    init() {
        self.payload = ContainerOpt{
            dep: null,
            intVal: 5,
            boolVal: true
        };
    }
}