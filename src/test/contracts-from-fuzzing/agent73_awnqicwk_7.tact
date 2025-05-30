struct OptionalNested {
    x: Int?;
    s: String?;
    inner: Inner?;
}

struct Inner {
    y: Int;
    flag: Bool?;
}

contract OptionalStructTest {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            x: null,
            s: "abc",
            inner: Inner{
                y: 7,
                flag: true
            }
        };
    }
}