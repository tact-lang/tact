// Test empty string in persistent struct
struct StrTest {
    s: String;
}

contract EmptyStr {
    val: StrTest = StrTest{ s: "" };
    init() {}
}