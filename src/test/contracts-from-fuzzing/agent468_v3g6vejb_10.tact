struct OptionalStructsContainer {
    s: SubStruct?;
}

struct SubStruct {
    f1: Int;
    f2: Bool?;
}

contract TestContract {
    foo: OptionalStructsContainer;

    init() {
        self.foo = OptionalStructsContainer{
            s: SubStruct{ f1: 7, f2: null }
        };
    }
}