struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{
                x: 17,
                y: null,
                z: "test",
            },
            flag: true,
        };
    }
}