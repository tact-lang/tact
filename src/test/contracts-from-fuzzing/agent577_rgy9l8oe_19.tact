struct Wrapper {
    inner: OptionalStruct;
}

struct OptionalStruct {
    value: Int?;
}

contract TestContract {
    wrapped: Wrapper;

    init() {
        self.wrapped = Wrapper{
            inner: OptionalStruct{ value: 123 }
        };
    }
}