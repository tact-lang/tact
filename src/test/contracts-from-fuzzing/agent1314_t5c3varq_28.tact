struct Container {
    foo: Inner;
}

struct Inner {
    bar: Nested;
}

struct Nested {
    val: Int?;
}

contract OptionalDeepNull {
    data: Container;

    init() {
        self.data = Container {
            foo: Inner{
                bar: Nested {
                    val: null
                }
            }
        };
    }
}