struct OptionalBoolEdge {
    val1: Bool = true;
    val2: Bool?;
}

contract TestOptionalBoolDefault {
    state: OptionalBoolEdge;

    init() {
        self.state = OptionalBoolEdge{
            val2: null
        };
    }
}