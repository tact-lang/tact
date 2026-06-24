struct Nested {
    x: Int;
    y: Bool;
    z: String?;
}

struct Wrapper {
    inner: Nested?;
    flag: Bool;
    number: Int?;
}

contract TestNestedStructOptional {
    info: Wrapper;

    init() {
        self.info = Wrapper{
            inner: null,
            flag: false,
            number: null
        };
    }
}