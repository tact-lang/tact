struct First {
    a: Int;
}

struct Second {
    nested: First?;
}

struct Third {
    inner: Second?;
}

contract ThreeWrapped {
    store: Third;

    init() {
        self.store = Third {
            inner: Second {
                nested: First { a: 42 }
            }
        };
    }
}
