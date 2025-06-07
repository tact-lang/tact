struct Inner {
    a: Int?;
    b: Int;
    c: Bool?;
}

struct Outer {
    x: Inner?;
    y: String?;
    z: Bool;
}

contract ComboStorage {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{
                a: 42,
                b: 100,
                c: null,
            },
            y: null,
            z: true,
        };
    }
}
