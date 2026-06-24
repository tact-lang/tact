struct Inner {
    x: Int;
    y: Bool;
    z: String?;
}

struct Middle {
    a: Inner;
    b: Int?;
    c: Bool;
}

struct Outer {
    first: Middle;
    second: Inner;
    note: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            first: Middle{
                a: Inner{ x: 1, y: true, z: "hello" },
                b: null,
                c: false,
            },
            second: Inner{ x: 2, y: false, z: null },
            note: "nested structs"
        };
    }
}