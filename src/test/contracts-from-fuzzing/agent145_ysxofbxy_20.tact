struct NestedString {
    s: String;
}

struct HasNestedString {
    val: Int;
    child: NestedString;
}

contract NestedStringStruct {
    data: HasNestedString;

    init() {
        self.data = HasNestedString {
            val: 1,
            child: NestedString { s: "nested" }
        };
    }
}