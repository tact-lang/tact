struct NestedString {
    s1: String;
    s2: String;
    s3: String;
}

struct Wrapper {
    inner: NestedString;
}

contract StringsNested {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: NestedString{
                s1: "x",
                s2: "y",
                s3: "z"
            }
        };
    }
}