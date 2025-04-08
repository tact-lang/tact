struct OptionalStruct {
    opt: Sub?;
}

struct Sub {
    a: Int;
}

contract Test {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            opt: null
        };
    }
}
