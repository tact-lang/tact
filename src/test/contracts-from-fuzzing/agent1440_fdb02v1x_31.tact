struct OptThenStruct {
    s: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract OptThenStructTest {
    val: OptThenStruct;

    init() {
        self.val = OptThenStruct{
            s: Inner{ x: 1, y: null }
        };
    }
}