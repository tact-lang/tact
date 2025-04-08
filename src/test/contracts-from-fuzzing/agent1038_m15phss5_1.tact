struct Nested {
    a: Int;
    b: Bool;
}

struct Wrapper {
    inner: Nested;
    flag: Bool;
}

contract WrapperStorage {
    data: Wrapper = Wrapper{ inner: Nested{ a: 7, b: true }, flag: false };
    init() {}
}