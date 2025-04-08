// Optional of nested with mixed optional non-optional
struct Inner {
    val: Int?;
    label: String;
}

contract OuterOptStruct {
    field: Inner?;

    init() {
        self.field = null;
    }
}
