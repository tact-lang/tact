struct InnerOptional { nested: Int?; }

struct OuterOptStruct {
    inner: InnerOptional?;
}

contract OptionalInsideOptional {
    foo: OuterOptStruct?;

    init() {
        self.foo = null;
    }
}