// Focus on strings and optionals nested inside struct
struct OptString {
    s: String?;
    b: Bool;
}

contract OptionalStrings {
    f: OptString = OptString{ s: null, b: true };
    init() {
        self.f.s = "Hello";
    }
}