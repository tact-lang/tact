struct NestedString {
    s: String;
    inner: InnerString;
}

struct InnerString {
    message: String;
    flag: Bool;
}

contract StringTest {
    data: NestedString;

    init() {
        self.data = NestedString{
            s: "Hello",
            inner: InnerString{
                message: "World",
                flag: true,
            },
        };
    }

    receive() {}
}
