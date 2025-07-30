struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    n: Nested;
    flag: Bool;
}

contract TestDeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            n: Nested{ x: 7, y: null, z: "hi" },
            flag: true
        };
    }
}