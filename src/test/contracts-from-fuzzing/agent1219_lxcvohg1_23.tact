// Test explicit null assign to optional struct field at init
struct Foo {
    a: Int;
}

contract NullOptAssign {
    f: Foo?;

    init() {
        self.f = null;
    }
}