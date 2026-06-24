struct ContainsString {
    s: String?;
}

struct OuterString {
    inner: ContainsString;
}

contract OptionalStringNested {
    os: OuterString;
    init() {
        self.os = OuterString{
            inner: ContainsString{
                s: null,
            }
        };
    }
}