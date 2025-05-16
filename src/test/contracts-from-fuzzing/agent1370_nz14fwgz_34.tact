// Optional of struct, inner has default
struct Inner {
    x: Int = 42;
}

contract OptStructWDefault {
    f: Inner?;

    init() {
        self.f = null;
    }
}