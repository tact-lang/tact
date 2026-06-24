struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    p: Int;
    q: Nested;
    r: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            p: 1,
            q: Nested{
                x: 2,
                y: true,
                z: "nested",
            },
            r: null,
        };
    }
}