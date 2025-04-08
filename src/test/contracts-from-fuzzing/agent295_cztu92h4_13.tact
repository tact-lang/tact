// Test optional struct inside optional struct (single level)
struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner?;
}

contract OptionalStructStruct {
    info: Outer = Outer{
        bar: null,
    };

    init() {
        self.info = Outer{
            bar: Inner{
                foo: 42,
            },
        };
    }

    receive() {
        self.info = self.info;
    }
}