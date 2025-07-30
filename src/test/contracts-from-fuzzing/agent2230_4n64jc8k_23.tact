// test default values in nested structs
struct InnerDefaults {
    x: Int = 3;
    y: Bool = true;
}

struct OuterDefaults {
    inner: InnerDefaults;
    z: String = "abc";
}

contract DefaultNestedTest {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{
            inner: InnerDefaults{},
            z: "overridden"
        };
    }
}