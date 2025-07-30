struct SOptional {
    value: Int?;
    flag: Bool?;
    nestedOpt: Inner?;
}

struct Inner {
    b: Bool;
}

contract OptTest {
    data: SOptional;

    init() {
        self.data = SOptional{
            value: null,
            flag: true,
            nestedOpt: null,
        };
    }

    receive() {
        self.data = SOptional{
            value: 9,
            flag: null,
            nestedOpt: Inner{b: true},
        };
    }
}
