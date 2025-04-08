struct Inner {
    intVal: Int;
    maybeBool: Bool?;
}

contract TestContract {
    outerOptional: Inner?;

    init() {
        self.outerOptional = Inner{
            intVal: 777,
            maybeBool: null
        };
    }
}