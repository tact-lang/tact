struct OptionalStruct {
    s: InnerS?;
}

struct InnerS {
    x: Int;
}

contract NestedOptStructTest {
    test: OptionalStruct;

    init() {
        self.test = OptionalStruct{s: null};
    }
}