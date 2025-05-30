struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool;
}

contract NestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            x: 100,
            y: Inner{
                a: 1,
                b: true,
                c: "ok"
            },
            z: false
        };
    }
}