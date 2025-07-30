struct OptionalSubStruct {
    s: Sub?;
}

struct Sub {
    x: Int;
}

contract OptTopLevel {
    data: OptionalSubStruct;

    init() {
        self.data = OptionalSubStruct{
            s: null
        };
    }
}