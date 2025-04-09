struct OptionalContainer {
    s: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract OptionalStructContainer {
    c: OptionalContainer;

    init() {
        self.c = OptionalContainer{
            s: null,
        };
    }
}
