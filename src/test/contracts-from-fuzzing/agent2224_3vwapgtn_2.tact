struct InnerNested {
    y: Int;
    z: Bool?;
}

struct Nested {
    n: Int;
    inner: InnerNested;
}

contract Test2 {
    data: Nested;
    init() {
        self.data = Nested{n: 5, inner: InnerNested{y: 10, z: null}};
    }
}