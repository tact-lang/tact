struct NestedString {
    val: String;
}

struct Outer {
    nested: NestedString;
}

contract NestedStringTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: NestedString{
                val: "nested hello",
            },
        };
    }
}