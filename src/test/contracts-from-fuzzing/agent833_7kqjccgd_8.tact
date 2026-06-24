struct OptionalStruct {
    foo: Int;
}

struct Container {
    s: OptionalStruct?;
}

contract OptionalStructField {
    cont: Container;

    init() {
        self.cont = Container{ s: null };
    }
}