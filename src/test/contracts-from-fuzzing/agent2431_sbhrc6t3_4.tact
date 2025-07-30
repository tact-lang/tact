struct Nested {
    z: Int?;
}

struct Outer {
    x: String;
    y: Nested;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: "test",
            y: Nested{
                z: null
            }
        };
    }
}