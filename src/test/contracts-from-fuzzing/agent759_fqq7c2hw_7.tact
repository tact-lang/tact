struct Inner {
    x: Int as int64;
    y: Int as uint8;
}

struct Wrapper {
    in1: Inner;
    in2: Inner;
}

contract SerializedNesting {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            in1: Inner{x: 5, y: 3},
            in2: Inner{x: 7, y: 1},
        };
    }
}
