struct OptInOpt {
    innerOptInt: Int?;
}

struct WithOptStruct {
    intVal: Int;
    optStruct: OptInOpt?;
}

contract OptionalInOptional {
    field: WithOptStruct?;

    init() {
        self.field = null;
    }
}