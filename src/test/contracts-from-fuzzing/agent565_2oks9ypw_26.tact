// Optional struct as persistent state
struct OptionalStruct {
    x: Int;
    y: String?;
}

contract ContainerOpt {
    optionalStruct: OptionalStruct?;

    init() {
        self.optionalStruct = null;
    }
}