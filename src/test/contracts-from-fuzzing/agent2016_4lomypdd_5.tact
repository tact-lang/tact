struct Nested {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

struct Outer {
    inner: Nested;
    d: Bool?;
}

contract Test {
    info: Outer;
    init() {
        self.info = Outer{ inner: Nested{}, d: null };
    }
}