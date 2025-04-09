struct Deep {
  nested: Nested;
}

struct Nested {
    inner: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract DeepStruct {
    storage: Deep;

    init() {
        self.storage = Deep{ nested: Nested{ inner: Inner{ foo: 123, bar: null } } };
    }
}