struct Wrapper {
    data: Int?;
}

struct DoubleWrapper {
    inner: Wrapper?;
}

contract OptionalNestedStruct {
    state: DoubleWrapper;

    init() {
        self.state = DoubleWrapper{
            inner: null,
        };
    }

    receive() {
        if (self.state.inner == null) {
            self.state = DoubleWrapper{
                inner: Wrapper{
                    data: 42,
                },
            };
        }
    }
}