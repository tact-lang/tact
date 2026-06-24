struct NestedString {
    s1: String;
    s2: String?;
}

contract NestedStringTest {
    data: NestedString;
    init() {
        self.data = NestedString{
            s1: "a",
            s2: null
        };
    }
}