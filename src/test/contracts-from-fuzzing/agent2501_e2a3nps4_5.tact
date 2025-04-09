struct OptionalInside {
    a: Int?;
}

struct Wrapper {
    x: Bool;
    inner: OptionalInside?;
}

contract NestedOptionalStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            x: false,
            inner: null
        };
    }
}