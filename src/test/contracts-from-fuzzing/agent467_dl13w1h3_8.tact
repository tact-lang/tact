// Optional of nested optional struct field (allowed on outer optional only)
struct Inner {
    val: Int;
}

contract OptionalStructField {
    field: Inner?;

    init() {
        self.field = null;
    }
}
