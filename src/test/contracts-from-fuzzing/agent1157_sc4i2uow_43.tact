struct NestedString {
    data: String;
}

struct Wrapper {
    inner: NestedString;
}

contract NestedStringContract {
    x: Wrapper;

    init() {
        self.x = Wrapper{ inner: NestedString{ data: "ok" } };
    }
}