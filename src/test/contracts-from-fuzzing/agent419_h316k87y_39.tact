// optional struct with nested optional bool
struct Inner {
    b: Bool?;
}

contract OptStruct {
    s: Inner?;

    init() {
        self.s = null;
    }
}