// Aggregate pushing optional struct inside optional struct
struct Inner {
    x: Int;
}

struct Wrapper {
    optInner: Inner?;
}

contract NestOpt {
    data: Wrapper?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = Wrapper{ optInner: Inner{ x: 42 } };
    }
}