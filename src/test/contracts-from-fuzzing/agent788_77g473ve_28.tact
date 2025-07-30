struct OptionalFieldOpt {
    x: Int?;
}

contract OptionalAssignedNull {
    field: OptionalFieldOpt;

    init() {
        self.field = OptionalFieldOpt{ x: null };
    }
}
