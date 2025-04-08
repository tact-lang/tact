// Struct with long string default
struct WithString {
    s: String = "This is a long default string value to test persistent constant serialization";
    n: Int = 7;
}

contract TestContract {
    f: WithString;
    init() {
        self.f = WithString{};
    }
}