struct NestedString {
    name: String;
}

struct WrapperWithNestedString {
    wrapped: NestedString;
}

contract NestedStringWrapTest {
    val: WrapperWithNestedString;

    init() {
        self.val = WrapperWithNestedString{
            wrapped: NestedString{
                name: "Ton"
            }
        };
    }
}