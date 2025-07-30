// Optional nested struct as a contract field
struct Inner {
    foo: Int;
}

contract OptNestedField {
    data: Inner?;

    init() {
        self.data = null;
    }
}