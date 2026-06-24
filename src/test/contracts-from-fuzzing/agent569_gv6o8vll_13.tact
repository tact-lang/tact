struct InnerOptional {
    x: Int?;
}
struct OuterOptional {
    inner: InnerOptional?;
    y: Bool;
}

contract OptionalStructField {
    val: OuterOptional;

    init() {
        self.val = OuterOptional{ inner: null, y: false };
    }
}