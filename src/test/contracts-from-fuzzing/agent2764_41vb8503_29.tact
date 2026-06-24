struct OptStruct {
    s: Inner?;
}
struct Inner {
    x: Int;
    y: Bool;
}

contract OptStructTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{ s: null };
    }
}