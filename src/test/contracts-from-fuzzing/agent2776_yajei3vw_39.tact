struct IntStruct {
    a: Int;
    b: Int;
}

struct Wraps {
    inner: IntStruct;
}

contract DeepWrapsTest {
    wraps: Wraps;

    init() {
        self.wraps = Wraps{ inner: IntStruct{ a: 11, b: 12 } };
    }
}
