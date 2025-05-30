struct Inner {
    a: Int;
    b: Bool;
}

struct Wrapper {
    data1: Inner;
    data2: Inner?;
}

contract OptionalStructInStruct {
    content: Wrapper;

    init() {
        self.content = Wrapper {
            data1: Inner { a: 1, b: true },
            data2: null
        };
    }
}