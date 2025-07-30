struct NestedString {
    inner: String;
}

struct Wrapper {
    nested: NestedString;
}

contract DeepStringWrap {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            nested: NestedString{
                inner: "hello"
            }
        };
    }
}