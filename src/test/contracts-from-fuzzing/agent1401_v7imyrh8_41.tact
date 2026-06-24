struct InnerString {
    s1: String;
}

struct OuterOptionalString {
    inner: InnerString?;
}

contract OptionalStructField {
    val: OuterOptionalString;
    init() {
        self.val = OuterOptionalString{
            inner: null
        };
    }
}