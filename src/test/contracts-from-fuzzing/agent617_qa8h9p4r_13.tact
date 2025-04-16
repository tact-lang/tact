struct NestedDefaults {
    a: Int = 5;
    b: Int;
}

struct Wrap {
    inner: NestedDefaults;
    label: String = "hi";
}

contract NestedDefTest {
    data: Wrap;
    init() {
        self.data = Wrap{
            inner: NestedDefaults{ b: 7 },
            label: "custom"
        };
    }
}