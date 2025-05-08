struct Inner {
    opt1: Int? as uint8;
    opt2: Int? as int64;
    val: Int as uint4;
}

struct Outer {
    a: Inner?;
    b: Int as int16;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{
                opt1: null,
                opt2: 1000,
                val: 7
            },
            b: -1234
        };
    }
}
