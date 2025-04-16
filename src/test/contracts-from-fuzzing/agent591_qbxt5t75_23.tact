struct OptionalStruct {
    s1: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract OptInside {
    state: OptionalStruct;

    init() {
        self.state = OptionalStruct{
            s1: null
        };
    }
}