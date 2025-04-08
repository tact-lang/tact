// Optional nested struct with optional content
struct Foo {
    value: Int?;
}

contract OptNested {
    item: Foo?;
    init() {
        self.item = null;
    }
}
