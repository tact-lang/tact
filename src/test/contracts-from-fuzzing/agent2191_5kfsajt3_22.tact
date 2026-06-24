struct NestedString {
    value: String;
}

struct OuterOptional {
    inner: NestedString?;
}

contract OptionalStructs {
    st: OuterOptional;

    init() {
        self.st = OuterOptional{ inner: null };
    }
}
