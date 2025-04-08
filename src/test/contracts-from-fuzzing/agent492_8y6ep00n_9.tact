struct OptionalStruct {
    s: Sub?;
}

struct Sub {
    x: Int;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            s: null
        };
    }
}