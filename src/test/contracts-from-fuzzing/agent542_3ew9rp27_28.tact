struct NestedString {
    text: String;
    inner: Inner;
}

struct Inner {
    label: String;
    deep: Deep;
}

struct Deep {
    id: Int;
}

contract TestContract {
    item: NestedString;

    init() {
        self.item = NestedString{
            text: "abc",
            inner: Inner{
                label: "def",
                deep: Deep{ id: 5 }
            }
        };
    }
}