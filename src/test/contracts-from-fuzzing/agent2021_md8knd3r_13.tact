struct OptionalBool {
    b: Bool?;
}

struct OptBoolContainer {
    o: OptionalBool?;
}

contract DeepOptBool {
    state: OptBoolContainer;

    init() {
        self.state = OptBoolContainer{
            o: OptionalBool{ b: true }
        };
    }
}
