struct OptionalNest {
    s: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Int;
}

contract Test {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            s: null,
        };
    }
}