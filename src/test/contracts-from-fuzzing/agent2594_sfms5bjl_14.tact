struct Container {
    a: Int;
    b: Int?;
    inner: Nested?;
}

struct Nested {
    flag: Bool;
    message: String;
}

contract MixedStruct {
    data: Container;

    init() {
        self.data = Container{
            a: 5,
            b: null,
            inner: null
        };
    }
}