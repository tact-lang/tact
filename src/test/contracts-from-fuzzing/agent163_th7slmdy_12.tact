struct OptionalStruct {
    val: Int?;
}

struct Container {
    inner: OptionalStruct?;
}

contract OptionalStructInField {
    s: Container;

    init() {
        self.s = Container{
            inner: null
        };
    }
}