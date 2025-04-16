struct Inner {
    x: Int;
    y: Bool?;
    z: String;
    t: Int?;
}

struct Outer {
    first: Inner;
    second: Inner;
    flag: Bool;
}

contract DeepNested {
    entry: Outer;

    init() {
        self.entry = Outer{
            first: Inner{ x: 1, y: true, z: "test1", t: null },
            second: Inner{ x: 2, y: false, z: "test2", t: 3 },
            flag: true,
        };
    }
}