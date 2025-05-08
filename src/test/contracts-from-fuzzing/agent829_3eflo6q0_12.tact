struct BigNested {
    a: Inner;
    b: Inner;
    c: Inner;
}

struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

contract BigNestedContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: Inner{ x: 1, y: null, z: "a" },
            b: Inner{ x: 2, y: true, z: "b" },
            c: Inner{ x: 3, y: false, z: "c" }
        };
    }
}