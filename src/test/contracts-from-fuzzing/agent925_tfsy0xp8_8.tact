struct Outer {
    x: Int;
    y: Bool;
    z: Inner;
}

struct Inner {
    flag: Bool;
    label: String;
}

contract MixedNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: 5,
            y: true,
            z: Inner{
                flag: false,
                label: "Nested Label",
            },
        };
    }
}