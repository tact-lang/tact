struct Inner {
    a: Int as uint8;
    b: Bool;
}

struct All {
    f1: Int;
    f2: Int as uint32;
    f3: Int as int64;
    f4: Bool;
    f5: String?;
    f6: Bool?;
    f7: Inner?;
}

contract Test {
    state: All;

    init() {
        self.state = All{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: true,
            f5: null,
            f6: null,
            f7: null
        };
    }
}