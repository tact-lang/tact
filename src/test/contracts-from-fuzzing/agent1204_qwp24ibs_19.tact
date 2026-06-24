// Optional of optional of struct (but single ? on outer)
struct InnerS {
    foo: Int;
}

contract SingleOptStruct {
    test: InnerS?;

    init() {
        self.test = null;
    }
}